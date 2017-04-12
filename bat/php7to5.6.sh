#!/bin/sh
# For php in web apps
sudo a2dismod php7.0 && sudo a2enmod php5.6 && sudo service apache2 restart
# For php-cli in the command line
sudo ln -sfn /usr/bin/php5.6 /etc/alternatives/php
