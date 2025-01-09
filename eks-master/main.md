# eks
- Amazon EKS (Elastic Kubernetes Service) is a fully managed service by AWS that helps you run Kubernetes clusters on AWS. Kubernetes is a system for automating the deployment, scaling, and management of containerized applications.
- With Amazon EKS, AWS handles most of the heavy lifting for you. It manages the infrastructure, networking, and security for your Kubernetes clusters, so you don’t have to worry about setting up and maintaining the control plane.

# setup eks using eksctl
1. eksctl create cluster --name=prod \
                      --region=us-east-1 \
                      --zones=us-east-1a,us-east-1b \
                      --without-nodegroup
#  IAM Roles for Service Accounts (IRSA).
2. eksctl utils associate-iam-oidc-provider \
    --region us-east-1 \
    --cluster prod \
    --approve
# OIDC(Open ID Connect)

3. eksctl create nodegroup --cluster=prod \
                       --region=us-east-1 \
                       --name=ng1 \
                       --node-type=t3.medium \
                       --nodes=2 \
                       --nodes-min=2 \
                       --nodes-max=4 \
                       --node-volume-size=20 \
                       --ssh-access \
                       --ssh-public-key=server \
                       --managed \
                       --asg-access \
                       --external-dns-access \
                       --full-ecr-access \
                       --appmesh-access \
                       --alb-ingress-access

# secrets base64:
echo -n  N09Xck5STlMtZGNtbVpCaA== | base64 --decode
echo -n G8Y+tGFKmN362swjqayulMd6mtQkRQV+F4kNx9C6 | base64

base64:
QUtJQVEzRUdVU1hXSkVVTUZXWE8=
RzhZK3RHRkttTjM2MnN3anFheXVsTWQ2bXRRa1JRVitGNGtOeDlDNg==

# port forwarding:
kubectl port-forward mypod 8080:80
kubectl port-forward <pod_name> <local-port>:<pod-port>

argocd login ec2-3-87-232-64.compute-1.amazonaws.com:<port> --username admin --password 7OWrNRNS-dcmmZBh --insecure

argocd repo add <repository-url> --username <your-username> --password <your-github-token>
