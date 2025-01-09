#!/bin/bash

set -e # Exit on error

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to install eksctl
install_eksctl() {
    echo -e "${GREEN}Installing eksctl...${NC}"
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
    sudo mv /tmp/eksctl /usr/local/bin
    echo -e "${GREEN}eksctl installation completed! Version: $(eksctl version)${NC}"
}

# Function to install kubectl
install_kubectl() {
    echo -e "${GREEN}Installing kubectl...${NC}"
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    rm kubectl
    echo -e "${GREEN}kubectl installation completed! Version: $(kubectl version --client --short)${NC}"
}

# Function to install Docker
install_docker() {
    echo -e "${GREEN}Installing Docker...${NC}"
    curl -fsSL https://get.docker.com | bash
    echo -e "${GREEN}Docker installation completed! Version: $(docker --version)${NC}"
}

# Function to install AWS CLI
install_aws_cli() {
    echo -e "${GREEN}Installing AWS CLI...${NC}"
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    apt install unzip -y
    unzip awscliv2.zip
    sudo ./aws/install
    rm awscliv2.zip
    echo -e "${GREEN}AWS CLI installation completed! Version: $(aws --version)${NC}"
}

# Function to install Helm
install_helm() {
    echo -e "${GREEN}Installing Helm...${NC}"
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
    echo -e "${GREEN}Helm installation completed! Version: $(helm version --short)${NC}"
}

# Function to install Argo CD CLI
install_argocd() {
    echo -e "${GREEN}Installing Argo CD CLI...${NC}"
    curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
    chmod +x /usr/local/bin/argocd
    echo -e "${GREEN}Argo CD CLI installation completed! Version: $(argocd version --client --short || echo 'Client version not available')${NC}"
}

# Function to install kubens
install_kubens() {
    echo -e "${GREEN}Installing kubens...${NC}"
    curl -LO https://github.com/ahmetb/kubectx/releases/download/v0.9.5/kubens_v0.9.5_linux_x86_64.tar.gz
    tar -xzf kubens_v0.9.5_linux_x86_64.tar.gz
    sudo mv kubens /usr/local/bin/
    sudo chmod +x /usr/local/bin/kubens
    rm kubens_v0.9.5_linux_x86_64.tar.gz
    echo -e "${GREEN}kubens installation completed! Version: $(kubens --help | head -n 1 || echo 'Version not available')${NC}"
}

# Check for sudo privileges
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}This script must be run with sudo privileges.${NC}"
    exit 1
fi

# Execute installation functions
install_eksctl
install_kubectl
install_docker
install_aws_cli
install_helm
install_argocd
install_kubens

# Verify installations
if command -v eksctl >/dev/null && command -v kubectl >/dev/null && command -v docker >/dev/null && command -v aws >/dev/null && command -v helm >/dev/null && command -v argocd >/dev/null && command -v kubens >/dev/null; then
    echo -e "${GREEN}eksctl, kubectl, Docker, AWS CLI, Helm, Argo CD CLI, and kubens are successfully installed!${NC}"
else
    echo -e "${RED}Installation failed. Please check the logs and try again.${NC}"
    exit 1
fi
