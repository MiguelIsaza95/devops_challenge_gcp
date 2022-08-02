#!/bin/bash

# Install ansible
sudo yum update -y
sudo yum install -y git
sudo yum install -y yum-utils
sudo yum install -y epel-repo
sudo yum install -y epel-release
sudo yum install -y dnf
sudo dnf install -y ansible
ansible --version

# Configure environment for ansible local provision
git clone https://github.com/MiguelIsaza95/devops_challenge_ansible.git
cd devops_challenge_ansible

# Run playbook
ansible-playbook jenkins.yml
sudo usermod -aG docker $USER
sudo usermod -aG docker jenkins
newgrp docker