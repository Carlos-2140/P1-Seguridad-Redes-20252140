#!/usr/bin/env bash
set -e
sudo apt update
sudo apt install -y apache2 openssl
sudo a2enmod ssl
# Copiar web-https.conf a /etc/apache2/sites-available/
sudo a2ensite web-https.conf
sudo a2dissite 000-default.conf || true
sudo apache2ctl configtest
sudo systemctl restart apache2
