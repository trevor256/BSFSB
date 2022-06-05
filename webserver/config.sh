#!/bin/bash

sudo apt-get update -y && sudo apt-get upgrade -y
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
sudo apt install ufw rustc cargo -y
cargo install trunk
rustup target add wasm32-unknown-unknown
sudo ufw allow proto tcp to 0.0.0.0/0 port 22
sudo ufw allow proto tcp to 0.0.0.0/0 port 443
echo "y" | sudo ufw enable
# sudo systemctl enable script.service
