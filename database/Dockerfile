FROM ubuntu as build

RUN (apt-get update && apt-get install -y mariadb-server)

## Database setup (example with MariaDB)
#RUN (service mariadb start && \
#    mysql -u root -e "CREATE DATABASE my_wiki;" && \
#    mysql -u root -e "CREATE USER 'wikiuser'@'localhost' IDENTIFIED BY 'database_password';" && \
#    mysql -u root -e "GRANT ALL PRIVILEGES ON my_wiki.* TO 'wikiuser'@'localhost' WITH GRANT OPTION;")

#Run MediaWiki setup script (This step will likely need more adjustment, including non-interactive setup or Docker secrets for secure handling of passwords)
RUN (php /var/www/html/maintenance/install.php \
    --dbname my_wiki  \
    --dbuser wikiuser  \
    --dbpass database_password  \
    --pass admin_password  \
    --server http://host.docker.internal:3306  \
    --scriptpath /var/www/html/maintenance  \
    PhyWiki  \
    Admin)

# Start Apache server in the foreground
#CMD apachectl -D FOREGROUND
CMD service mariadb start && service apache2 start