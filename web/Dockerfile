FROM ubuntu as build

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow

RUN (apt-get update && apt-get install -y \
    wget \
    php \
    php-apcu \
    php-common \
    php-intl \
    php-json \
    php-mbstring \
    php-mysql \
    php-xml \
    apache2)

# Очистить директорию перед установкой
RUN (mkdir -p /var/www/html/ && \
    rm -rf /var/www/html/*)

WORKDIR /tmp
RUN (wget https://releases.wikimedia.org/mediawiki/1.39/mediawiki-1.39.3.tar.gz && \
    tar -vxf mediawiki-1.39.3.tar.gz && \
    mv mediawiki-1.39.3/* /var/www/html/ && \
    rm -rf mediawiki-1.39.3.tar.gz)

#Run MediaWiki setup script (This step will likely need more adjustment, including non-interactive setup or Docker secrets for secure handling of passwords)
RUN (php /var/www/html/maintenance/install.php \
    --dbname ${WIKI_DATABASE}  \
    --dbuser ${WIKI_USER}  \
    --dbpass ${WIKI_PASSWORD}  \
    --pass ${WIKI_ADMIN_PASSWORD}  \
    --server http://db:3306  \
    --scriptpath /var/www/html/maintenance  \
    ${WIKI_SITE_NAME}  \
    ${WIKI_ADMIN_USER})

# Start Apache server in the foreground
CMD apachectl -D FOREGROUND