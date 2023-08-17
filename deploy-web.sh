#!/bin/bash
PACKAGES="unzip httpd wget"
SERVICE="httpd"
URL="https://www.tooplate.com/zip-templates/2132_clean_work.zip"
ARTIFACT="2132_clean_work"
TEMPDIR="/temp/webfiles"

echo #############################################################
sudo yum install $PACKAGES -y
echo #############################################################
sudo systemctl start $SERVICE
sudo systemctl enable $SERVICE
echo #############################################################
mkdir -p $TEMPDIR
cd $TEMPDIR
echo #############################################################
wget $URL
unzip $ARTIFACT.zip
sudo cp -r $ARTIFACT/* /var/www/html/
echo #############################################################
sudo systemctl restart $SERVICE
sudo systemctl status $SERVICE
echo #############################################################
