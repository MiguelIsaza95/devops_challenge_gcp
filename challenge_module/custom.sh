#!/bin/bash

# Install ansible
sudo yum install git -y
sudo yum install -y yum-utils
sudo dnf install ansible-core -y
ansible --version
cd ..
# Configure environment for ansible local provision
git clone https://github.com/MiguelIsaza95/devops_challenge_ansible.git
cd devops_challenge_ansible

# Run playbook
ansible-playbook jenkins.yml