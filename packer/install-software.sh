#!/bin/bash

# Update OS and install Apache web server
sudo apt update -y
sudo apt install -y apache2

# Create a simple index.html for the web server
sudo echo "<h1>Welcome to the Web Application</h1>" > /var/www/html/index.html

# Start the Apache server
sudo systemctl start apache2

# Ensure Apache starts on boot
sudo systemctl enable apache2
