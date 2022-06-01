#!/bin/sh
#####################################
#  BSFSB
#####################################

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform

echo "${GREEN}${bold} Install AWS, GCP, Azure, and Terraform CLI?${NC}${normal} (y/n)"
read -r reply
  if [ "$reply" = y ] || [ "$reply" = Y ]
   then 
   
        echo "${GREEN}${bold} Installing AWS CLI..${NC}${normal}"
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
        unzip awscliv2.zip
        sudo ./aws/install

        echo "${GREEN}${bold} Installing GCP CLI..${NC}${normal}"
        sudo apt-get install apt-transport-https ca-certificates gnupg -y
        echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
        sudo curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
        sudo apt-get update -y && sudo apt-get install google-cloud-cli -y
   
        echo "${GREEN}${bold} Installing Azure CLI..${NC}${normal}"
        curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
   
        echo "${GREEN}${bold} Installing Terraform CLI..${NC}${normal}"
        curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
        sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
        sudo apt-get update && sudo apt-get install terraform
    else
       echo "${RED}${bold}Not installed${NC}${normal}"
    fi
aws configure
gcloud init
az login
mkdir terraform
touch terraform/aws.tf
touch terraform/az.tf
touch terraform/gcp.tf
cd terraform
terraform init
#terraform fmt
#terraform validate
#terraform apply
#terraform destroy
