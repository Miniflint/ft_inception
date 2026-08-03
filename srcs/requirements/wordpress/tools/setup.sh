#!/bin/bash
set -e

# WordPress installation path
WP_PATH="/var/www/wordpress"

# Ensure the WordPress directory exists
mkdir -p "$WP_PATH"

# Download WordPress if the persistent volume is empty
if [ ! -f "$WP_PATH/wp-load.php" ]; then
    echo "WordPress files not found, downloading..."

    wp core download \
        --path="$WP_PATH" \
        --allow-root
fi

echo "Waiting for MariaDB..."

# Wait until MariaDB is ready to accept connections
until mariadb-admin ping \
    --host=mariadb \
    --user="$MYSQL_USER" \
    --password="$MYSQL_PASSWORD" \
    --silent >/dev/null 2>&1; do
    sleep 2
done

echo "MariaDB is ready."

# Create wp-config.php if it does not exist
if [ ! -f "$WP_PATH/wp-config.php" ]; then
    cp "$WP_PATH/wp-config-sample.php" "$WP_PATH/wp-config.php"

    # Configure the MariaDB connection
    sed -i "s/database_name_here/${MYSQL_DATABASE}/" "$WP_PATH/wp-config.php"
    sed -i "s/username_here/${MYSQL_USER}/" "$WP_PATH/wp-config.php"
    sed -i "s/password_here/${MYSQL_PASSWORD}/" "$WP_PATH/wp-config.php"
    sed -i "s/localhost/mariadb/" "$WP_PATH/wp-config.php"
fi

# Install WordPress and create the database tables if necessary
if ! wp core is-installed \
    --path="$WP_PATH" \
    --allow-root; then

    echo "Installing WordPress database..."

    wp core install \
        --path="$WP_PATH" \
        --url="https://${DOMAIN_NAME}" \
        --title="Inception" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --skip-email \
        --allow-root
fi

# Create the secondary WordPress user if it does not exist
if ! wp user get "$WP_USER" \
    --path="$WP_PATH" \
    --allow-root >/dev/null 2>&1; then

    wp user create \
        "$WP_USER" \
        "$WP_USER_EMAIL" \
        --user_pass="$WP_USER_PASSWORD" \
        --role=author \
        --path="$WP_PATH" \
        --allow-root
fi

# Set the correct ownership for WordPress files
chown -R www-data:www-data "$WP_PATH"

# Create the PHP-FPM runtime directory
mkdir -p /run/php

# Start PHP-FPM in the foreground
echo "Starting PHP-FPM..."
exec php-fpm7.4 -F