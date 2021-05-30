#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl restart apache2.service
sudo apt-get update
sudo apt-get install python3-pip apache2 libapache2-mod-wsgi-py3