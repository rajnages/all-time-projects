* Logging Overview *
Logging is crucial in any distributed system, especially in Kubernetes, to monitor application behavior,
detect issues, and ensure the smooth functioning of microservices.

Tools Available for Logging in Kubernetes
🗂️ EFK Stack (Elasticsearch, Fluentbit, Kibana)
🗂️ EFK Stack (Elasticsearch, FluentD, Kibana)
🗂️ ELK Stack (Elasticsearch, Logstash, Kibana)
📊 Promtail + Loki + Grafana

EFK Stack (Elasticsearch, Fluentbit, Kibana)
EFK is a popular logging stack used to collect, store, and analyze logs in Kubernetes.
Elasticsearch: Stores and indexes log data for easy retrieval.
Fluentbit: A lightweight log forwarder that collects logs from different sources and sends them to Elasticsearch.
Kibana: A visualization tool that allows users to explore and analyze logs stored in Elasticsearch.

# Create IAM Role for Service Account
eksctl create iamserviceaccount \
    --name ebs-csi-controller-sa \
    --namespace kube-system \
    --cluster observability \
    --role-name AmazonEKS_EBS_CSI_DriverRole \
    --role-only \
    --attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
    --approve

ARN=$(aws iam get-role --role-name AmazonEKS_EBS_CSI_DriverRole --query 'Role.Arn' --output text)

# Deploy EBS CSI Driver
eksctl create addon --cluster observability --name aws-ebs-csi-driver --version latest \
    --service-account-role-arn $ARN --force

# Create Namespace for Logging
kubectl create namespace logging

# Install Elasticsearch on K8s
helm repo add elastic https://helm.elastic.co

helm install elasticsearch \
 --set replicas=1 \
 --set volumeClaimTemplate.storageClassName=gp2 \
 --set persistence.labels.enabled=true elastic/elasticsearch -n logging

# retrieve username and password:
# for username
kubectl get secrets --namespace=logging elasticsearch-master-credentials -ojsonpath='{.data.username}' | base64 -d
# for password
kubectl get secrets --namespace=logging elasticsearch-master-credentials -ojsonpath='{.data.password}' | base64 -d

# Install Kibana
helm install kibana --set service.type=LoadBalancer elastic/kibana -n logging

# Install Fluentbit with Custom Values/Configurations
helm repo add fluent https://fluent.github.io/helm-charts
helm install fluent-bit fluent/fluent-bit -f fluentbit-values.yaml -n logging

username: elastic
password: qx5e1Q70SjqHUSrw