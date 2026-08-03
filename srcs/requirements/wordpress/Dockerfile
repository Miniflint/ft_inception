# Wordpress container, php-fpm only
FROM debian:bullseye

# Prevent debconf warnings
ENV DEBIAN_FRONTEND=noninteractive

# Update dependencies
RUN apt update -y && apt upgrade -y && \
    apt install -y php-fpm php-mysql curl wget tar gettext-base mariadb-client && \
    rm -rf /var/lib/apt/lists/*

# Ensure WordPress directories
RUN mkdir -p /var/www/wordpress
WORKDIR /var/www/wordpress

# Install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Configure php-fpm to listen on port 9000
RUN sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

# Copy setup script
COPY ./tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

# Expose port and run entrypoint
EXPOSE 9000
ENTRYPOINT ["/setup.sh"]

