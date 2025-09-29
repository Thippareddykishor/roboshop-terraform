
# resource "aws_eks_addon" "addons" {
#   for_each = var.addons
#   cluster_name = aws_eks_cluster.main.name
#   addon_name = each.key
# }

resource "null_resource" "argocd" {
  depends_on = [ null_resource.kubeconfig ]

  provisioner "local-exec" {
    command = <<EOF
    kubectl create ns argocd
    kubectl apply -n argocd  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml 
    kubectl patch svc argocd-server -n argocd --patch '{"spec": {"type" : "Loadbalancer"}}'
    EOF
  }
}