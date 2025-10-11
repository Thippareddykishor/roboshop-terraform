
# resource "aws_eks_addon" "addons" {
#   for_each = var.addons
#   cluster_name = aws_eks_cluster.main.name
#   addon_name = each.key
# }

# resource "null_resource" "kubeconfig" {
#   depends_on = [ aws_eks_node_group.main ]

#   provisioner "local-exec" {
#     command = "aws eks update-kubeconfig --name ${{var.env}"
#   }
#   }

resource "null_resource" "kubeconfig" {
  depends_on = [aws_eks_node_group.main]

  triggers = {
    always = timestamp()
  }

  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name ${var.env}"
  }
}

# resource "null_resource" "argocd" {
#   depends_on = [ null_resource.kubeconfig ]

#   provisioner "local-exec" {
#     command = <<EOF
#     kubectl create ns argocd
#     kubectl apply -n argocd  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml 
#     kubectl patch svc argocd-server -n argocd --patch '{"spec": {"type" : "LoadBalancer"}}'
#     EOF
#   }
# }

resource "helm_release" "ingress" {
  depends_on  = [ null_resource.kubeconfig ]
  name        = "ingress-nginx"
  repository  = "https://kubernetes.github.io/ingress-nginx"
  chart       = "ingress-nginx"

  values = [
    file("${path.module}/helm-config/ingress.yml")
    ]
}

resource "helm_release" "cert-manager" {
  depends_on = [ null_resource.kubeconfig ]
  name = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart = "cert-manager"
  namespace = "cert-manager"
  create_namespace = true

  set = [ {
    name = "crds.enabled"
    value = "true"
  }]
}


resource "null_resource" "cert-manager-cluster-issuer" {
  depends_on = [ null_resource.kubeconfig,helm_release.cert-manager ]

  provisioner "local-exec" {
    command = "kubectl apply -f ${path.module}/helm-config/cluster-issue.yml"
  }
}

resource "helm_release" "argocd" {
  depends_on = [ null_resource.kubeconfig ]
  name = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart = "argo-cd"
  namespace = "argocd"
  create_namespace = true
  wait = false

  set  = [{
    name = "global.domain"
    value = "argocd-dev1.kommanuthala.store"
  }]
  values = [
    file("${path.module}/helm-config/argocd.yml")
    
    ]
}

