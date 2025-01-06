DNS NAME
S3 BUCKET
CREATE A EC2 WITH T2.MEDIUM
IAM ROLE AND ASSIGN IT TO EC2
CONNECT TO  EC2 INSTANCE AND GENERATE SSH ROLE
download Kops and Kubectl to usr/local/bin and change permissions.

# Download Kubectl and give permissions.
# edit .bashrc and add all the env variables

export NAME=cloud-dev.xyz
export KOPS_STATE_STORE=s3://cloudvishwakarma.in
export AWS_REGION=us-east-1
export CLUSTER_NAME=cloudvishwakarma.in
export EDITOR='/usr/bin/vi'
#export K8S_VERSION=1.6.4

# After copying the above files to .bashrc run “ source .bashrc ”.

# Create a Cluster using Kops and generate a cluster file and save it carefully and do neccessary changes

kops create cluster \
  --name=cloud-dev.xyz \
  --state=s3://cloud-dev.xyz-bucket \
  --zones=us-east-1a,us-east-1b \
  --node-count=2 \
  --node-size=t3.medium \
  --ssh-public-key=~/.ssh/id_rsa.pub \
  --dns-zone=cloud-dev.xyz \
  --dry-run --output yaml





# 6 Node cluster

# kops create cluster --name=cloudvishwakarma.in \
# --state=s3://cloudvishwakarma.in --zones=us-east-1a,us-east-1b,us-east-1c \
# --node-count=3 --master-count=3 --node-size=t3.medium --master-size=t3.medium \
# --master-zones=us-east-1a,us-east-1b,us-east-1c --master-volume-size 10 --node-volume-size 10 \
# --ssh-public-key ~/.ssh/id_rsa.pub \
# --dns-zone=cloudvishwakarma.in --dry-run --output yaml


# One done run below commands to create the cluster

kops create -f cluster.yml
kops update cluster --name cloudvishwakarma.in --yes --admin
kops validate cluster --wait 10m
kops delete -f cluster.yml  --yes
