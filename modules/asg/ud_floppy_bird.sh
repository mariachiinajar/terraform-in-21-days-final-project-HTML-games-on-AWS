#! /bin/bash

yum update -y 
yum install -y httpd git
git clone https://github.com/nebez/floppybird.git
cp -R floppybird/* /var/www/html
systemctl start httpd && systemctl enable httpd

