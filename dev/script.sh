#!/bin/bash
sudo apt-get update -y
sudo apt install -y curl
sudo apt install -y vim
sudo apt-get install mysql-server -y
sudo apt-get install awscli -y
sudo apt install -y apache2
sudo systemctl status apache2
sudo systemctl start apache2
sudo chown -R $USER:$USER /var/www/html
sudo echo "<html><body><h1>Learning Terraform Scripting!! </h1></body></html>" > /var/www/html/index.html
sleep 2
sudo apt install -y wget
sleep 2
sudo wget https://dev.mysql.com/downloads/file/?id=509716 > /tmp
sudo curl localhost

