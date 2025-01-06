#!/bin/bash

set -e  # Exit on error

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

# Check for sudo privileges
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}This script must be run with sudo privileges.${NC}"
    exit 1
fi

# Execute installation functions
install_eksctl
install_kubectl
install_docker

# Verify installations
if command -v eksctl >/dev/null && command -v kubectl >/dev/null && command -v docker >/dev/null; then
    echo -e "${GREEN}eksctl, kubectl, and Docker are successfully installed!${NC}"
else
    echo -e "${RED}Installation failed. Please check the logs and try again.${NC}"
    exit 1
fi
