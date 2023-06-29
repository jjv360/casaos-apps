##
## Dockerfile for a self-contained WordPress installation
FROM bitnami/minideb

# Update package list
RUN apt-get update

# Install dependencies (install_packages comes with bitnami/minideb)
RUN install_packages wget ca-certificates php php-mysql php-gd apache2 libapache2-mod-php mariadb-server

# Install latest WordPress to /internal/wordpress ... on first start, we will copy this to /var/www/html
# in case the user has mapped that folder to a volume
RUN mkdir /internal && \
    cd /internal && \
    wget https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    rm latest.tar.gz
    #rm -r /var/www/html
    #mv /tmp/wordpress /var/www/html

# Install the WordPress CLI tool
# cd /tmp && \
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
# chmod +x wp-cli.phar && \
# sudo mv wp-cli.phar /usr/local/bin/wp

# Copy start script
COPY /start.sh /internal/start.sh
RUN chmod +x /internal/start.sh

# Copy pre-made configuration
# COPY /wp-config.php /var/www/html/wp-config.php

# Run the start script on startup
CMD [ "/internal/start.sh" ]