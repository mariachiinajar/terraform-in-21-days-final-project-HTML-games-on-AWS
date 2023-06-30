#! /bin/bash

yum update -y 
yum install -y httpd git
echo "Hello from $(hostname)" > /var/www/html/index.html
systemctl start httpd && systemctl enable httpd

