#!/usr/bin/env bash

echo "Installing Apache and setting it up..."
# Install apache2 v2.4
apt-get update > /dev/null 2>&1
apt-get install -y apache2=2.4.18-2ubuntu3.17 > /dev/null 2>&1

# Set up apache2
## Make /var/www/html to the symbolic link of /vagrant/src/index.html
ln -fs /vagrant/src/index /var/www/html
## Change document Root
sed -i -e "s/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/html\/index/" /etc/apache2/sites-available/000-default.conf

## Reflect 000-default.conf
systemctl reload apache2