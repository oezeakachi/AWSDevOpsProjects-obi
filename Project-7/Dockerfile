# Start with a base image that is known to work and has a package manager ->
FROM buildpack-deps:focal

# Install necessary packages for your tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    unzip \
    curl \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Terraform
RUN curl -sL https://releases.hashicorp.com/terraform/1.6.0/terraform_1.6.0_linux_amd64.zip -o terraform.zip && \
    unzip terraform.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform.zip

# Install AWS CLI using pip
RUN pip3 install awscli

# Set the working directory
WORKDIR /app