#!/bin/bash

echo $WIKI_DATABASE
echo $WIKI_USER
echo $WIKI_PASSWORD
echo $WIKI_ADMIN_PASSWORD
echo $WIKI_ADMIN_PASSWORD
echo $WIKI_ADMIN_USER

# Run MediaWiki setup
php /var/www/html/maintenance/install.php \
    --dbname $WIKI_DATABASE  \
    --dbuser $WIKI_USER  \
    --dbpass $WIKI_PASSWORD  \
    --pass $WIKI_ADMIN_PASSWORD  \
    --server http://db:3306  \
    --scriptpath /var/www/html/maintenance  \
    $WIKI_SITE_NAME  \
    $WIKI_ADMIN_USER

# Start Apache server in the foreground
apachectl -D FOREGROUND