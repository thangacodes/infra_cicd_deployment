#! /bin/bash
echo "Going to install httpd on Amazon Linux Machine2"
sudo yum update -y
sudo yum install -y httpd
sleep 4
sudo systemctl start httpd
sudo systemctl enable httpd
sudo cp index.html /var/www/html/index.html
sudo systemctl restart httpd