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
    apache2  \
    && rm -rf /var/lib/apt/lists/*)

# Очистить директорию перед установкой
RUN (mkdir -p /var/www/html/ && \
    rm -rf /var/www/html/*)

WORKDIR /tmp
RUN (wget https://releases.wikimedia.org/mediawiki/1.39/mediawiki-1.39.3.tar.gz && \
    tar -vxf mediawiki-1.39.3.tar.gz && \
    mv mediawiki-1.39.3/* /var/www/html/ && \
    rm -rf mediawiki-1.39.3.tar.gz)

# Add setup script
COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

# Start Apache server in the foreground
ENTRYPOINT ["/setup.sh"]