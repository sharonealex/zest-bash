#! /bin/bash

# Variable declaration
PACKAGE="wget unzip httpd"
SVC="httpd"
URL="https://www.tooplate.com/zip-templates/2126_antique_cafe.zip"
#ARTIFACT_NAME="2126_antique_cafe"
TEMPDIR="/tmp/webfiles"

# Installing packages
sudo yum install $PACKAGE -y > /dev/null

# Start and Enable service
sudo systemctl start $SVC

sudo systemctl enable $SVC

# Creating temp directory

mkdir -p $TEMPDIR

cd $TEMPDIR

wget $URL > /dev/null

unzip $1.zip > /dev/null

sudo cp -r $1/* /var/www/html/

# Bounce the service
sudo systemctl restart $SVC

# Clean Up
rm -rf $TEMPDIR

sudo systemctl status httpd
ls /var/www/html
