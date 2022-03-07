#! /bin/bash

# Installing packages
sudo yum install wget unzip httpd -y

# Start and Enable service
sudo systemctl start httpd

sudo systemctl enable httpd

# Creating temp directory

mkdir -p /tmp/webfiles

cd /tmp/webfiles

wget https://www.tooplate.com/zip-templates/2126_antique_cafe.zip

unzip 2126_antique_cafe.zip

sudo cp -r 2126_antique_cafe/* /var/www/html/

# Bounce the service
sudo systemctl restart httpd

# Clean Up
rm -rf /tmp/webfiles
