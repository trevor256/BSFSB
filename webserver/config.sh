#!/bin/bash

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt install ufw -y
sudo ufw allow proto tcp to 0.0.0.0/0 port 22
sudo ufw allow proto tcp to 0.0.0.0/0 port 443
echo "y" | sudo ufw enable
# sudo systemctl enable script.service
