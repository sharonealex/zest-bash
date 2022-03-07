#! /bin/bash

# Installing packages
sudo yum install wget unzip httpd -y > /dev/null

# Start and Enable service
sudo systemctl start httpd

sudo systemctl enable httpd

# Creating temp directory

mkdir -p /tmp/webfiles

cd /tmp/webfiles

wget https://www.tooplate.com/zip-templates/2126_antique_cafe.zip > /dev/null

unzip 2126_antique_cafe.zip > /dev/null

sudo cp -r 2126_antique_cafe/* /var/www/html/

# Bounce the service
sudo systemctl restart httpd

# Clean Up
rm -rf /tmp/webfiles

sudo systemctl status httpd
ls -ltr /var/www/html

