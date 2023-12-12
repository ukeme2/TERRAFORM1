#!/bin/bash

#!/bin/bash

# Update package lists
apt-get update -y

# Install Ansible
apt-get install -y ansible

# Install Docker
apt-get install -y docker.io

# Enable Docker service
sudo systemctl enable docker

# Start Docker service
sudo systemctl start docker
