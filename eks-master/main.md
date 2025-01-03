# eks
- Amazon EKS (Elastic Kubernetes Service) is a fully managed service by AWS that helps you run Kubernetes clusters on AWS. Kubernetes is a system for automating the deployment, scaling, and management of containerized applications.
- With Amazon EKS, AWS handles most of the heavy lifting for you. It manages the infrastructure, networking, and security for your Kubernetes clusters, so you don’t have to worry about setting up and maintaining the control plane.

# setup eks using eksctl
1. eksctl create cluster --name=Cluster1 \
                      --region=us-east-1 \
                      --zones=us-east-1a,us-east-1b \
                      --without-nodegroup
#  IAM Roles for Service Accounts (IRSA).
2. eksctl utils associate-iam-oidc-provider \
    --region us-east-1 \
    --cluster Cluster1 \
    --approve
# OIDC(Open ID Connect)

3. eksctl create nodegroup --cluster=Cluster1 \
                       --region=us-east-1 \
                       --name=ng1 \
                       --node-type=t3.medium \
                       --nodes=2 \
                       --nodes-min=2 \
                       --nodes-max=4 \
                       --node-volume-size=20 \
                       --ssh-access \
                       --ssh-public-key=kube-demo \
                       --managed \
                       --asg-access \
                       --external-dns-access \
                       --full-ecr-access \
                       --appmesh-access \
                       --alb-ingress-access
