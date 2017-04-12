#!/bin/sh
# For php in web apps
sudo a2dismod php5 && sudo a2enmod php7.0 && sudo service apache2 restart
# For php-cli in the command line
sudo ln -sfn /usr/bin/php7.0 /etc/alternatives/php