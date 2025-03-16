#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Deployed via Terraform :: Kazi Tamim</h1>" | sudo tee /var/www/html/index.html
