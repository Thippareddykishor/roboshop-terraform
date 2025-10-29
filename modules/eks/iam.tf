resource "aws_iam_role" "cluster-role" {
  name = "${var.env}-eks-cluster-role"
  assume_role_policy = jsonencode({
    Version= "2012-10-17"
    Statement=[
        {
            Action = [
                "sts:AssumeRole",
                "sts:TagSession"
            ]
            Effect="Allow"
            Principal ={
                Service = "eks.amazonaws.com"
            }
        },
    ]
    
  })
}

resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.cluster-role.name
}

resource "aws_iam_role" "node-role" {
  name =  "${var.env}-eks-node-role"
  assume_role_policy = jsonencode({
    Version="2012-10-17"
    Statement = [
        {
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Principal ={
                Service = "ec2.amazonaws.com"
            }
        }
    ]
  }
  )
}

resource "aws_iam_role_policy_attachment" "node-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role = aws_iam_role.node-role.name
}

resource "aws_iam_role_policy_attachment" "node-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.node-role.name
}

resource "aws_iam_role_policy_attachment" "node-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.node-role.name
}


resource "aws_iam_role" "external-dns" {
  name = "${var.env}-eks-external-dns-role"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
            "Effect": "Allow",
            "Principal": {
                "Service": "pods.eks.amazonaws.com"
            },
            "Action": [
                "sts:AssumeRole",
                "sts:TagSession"
            ]
        }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "external-dns-route53-full-access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
  role = aws_iam_role.external-dns.name
}

resource "aws_eks_pod_identity_association" "external-dns" {
  cluster_name = aws_eks_cluster.main.name
  namespace = "default"
  service_account = "external-dns"
  role_arn = aws_iam_role.external-dns.arn
}

resource "aws_iam_role" "k8s-prometheus" {
  name = "${var.env}-k8s-prometheus-server-role"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
            "Effect": "Allow",
            "Principal": {
                "Service": "pods.eks.amazonaws.com"
            },
            "Action": [
                "sts:AssumeRole",
                "sts:TagSession"
            ]
        }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "k8s-prometheus-ec2-read-access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
  role = aws_iam_role.k8s-prometheus.name
}

resource "aws_eks_pod_identity_association" "k8s-prometheus" {
  cluster_name = aws_eks_cluster.main.name
  namespace = "default"
  service_account = "kube-prom-stack-kube-prome-prometheus"
  role_arn = aws_iam_role.k8s-prometheus.arn

}


resource "aws_iam_role" "cluster_autoscaler" {
  name = "${var.env}-eks-cluster-autoscaler-role"
  assume_role_policy = jsonencode({
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "pods.eks.amazonaws.com"
      },
      "Action": [
        "sts:AssumeRole",
        "sts:TagSession"
      ]
    }
  ]
  })
}


resource "aws_iam_role_policy" "cluster_autoscaler_policy" {
  name = "${var.env}-eks-cluster-autoscaler-policy"
  role = aws_iam_role.cluster_autoscaler.id

  policy = jsondecode({
  "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "autoscaling:DescribeAutoScalingGroups",
            "autoscaling:DescribeAutoScalingInstances",
            "autoscaling:DescribeLaunchConfigurations",
            "autoscaling:DescribeScalingActivities",
            "ec2:DescribeImages",
            "ec2:DescribeInstanceTypes",
            "ec2:DescribeLaunchTemplateVersions",
            "ec2:GetInstanceTypesFromInstanceRequirements",
            "eks:DescribeNodegroup"
          ],
          "Resource" : ["*"]
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "autoscaling:SetDesiredCapacity",
            "autoscaling:TerminateInstanceInAutoScalingGroup"
          ],
          "Resource" : ["*"]
        }
      ]    
  })
}



resource "aws_eks_pod_identity_association" "cluster_autoscaler" {
  cluster_name = aws_eks_cluster.main.name
  namespace = "kube-system"
  service_account = "cluster-autoscaler-aws-cluster-autoscaler"
  role_arn = aws_iam_role.cluster_autoscaler.arn

}