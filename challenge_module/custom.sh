#!/bin/bash

# Install ansible
sudo yum update -y
sudo yum install -y git
sudo yum install -y yum-utils
sudo dnf install -y ansible-core
ansible --version

# Configure environment for ansible local provision
git clone https://github.com/MiguelIsaza95/devops_challenge_ansible.git
cd devops_challenge_ansible

# Run playbook
ansible-playbook jenkins.yml