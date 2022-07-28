#!/bin/bash

# Install ansible
sudo apt-get update -y
sudo apt-get install -y software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible
sudo apt-get install -y python python-pip
ansible --version

# Configure environment for ansible local provision
sudo apt-get install -y git
pip install pip --upgrade
pip install ansible --upgrade
git clone https://github.com/MiguelIsaza95/Ansible_ramup.git
cd Ansible_ramup

# Run playbook
ansible-playbook jenkins.yml