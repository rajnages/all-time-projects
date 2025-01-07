# Use Ubuntu as the base image
FROM ubuntu:latest

# Set the maintainer label
LABEL maintainer="your-email@example.com"

# Update and install necessary tools
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    python3 \
    python3-pip \
    groff \
    less \
    jq

# Install AWS CLI version 2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && sudo ./aws/install \
    && rm -rf awscliv2.zip

# # Verify AWS CLI installation
# RUN aws --version

# # Set default AWS region (optional)
# ENV AWS_DEFAULT_REGION=us-east-1

# Set the working directory (optional)
WORKDIR /root

# Default command (optional, you can override when running the container)
CMD ["bash"]
