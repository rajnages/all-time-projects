1. first attach policy to ec2 full access nodes iam role
2. Get the IAM role Worker Nodes using and Associate this policy to that role
kubectl -n kube-system describe configmap aws-auth
3. deploy ebs csi driver:
kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=master"
kubectl get pods -n kube-system
