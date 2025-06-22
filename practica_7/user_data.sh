#!/bin/bash

# Print a welcome message
echo "Welcome to Practica 6! This is your user_data script. > msj.txt"

apt update -y
apt install -y httpd
syctel enable httpd
systemctl start httpd