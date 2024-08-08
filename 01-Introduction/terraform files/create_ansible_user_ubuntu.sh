#!/bin/bash
sudo useradd -d /home/ansible -s /bin/bash -m ansible
sudo echo "ansible:ansible" | sudo chpasswd
sudo echo "ansible  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible
sudo sed -i 's|[#]q*PasswordAuthentication no|PasswordAuthentication yes|g' /etc/ssh/sshd_config
sudo sed -i 's|KbdInteractiveAuthentication no|KbdInteractiveAuthentication yes|g' /etc/ssh/sshd_config
sudo systemctl restart ssh.service
