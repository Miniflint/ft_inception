#!/bin/bash
set -e

SSL_DIR="/etc/nginx/ssl"
CONF_DIR="/etc/nginx/conf.d"
CONF_FILE="$CONF_DIR/default.conf"

# Create directories if missing
mkdir -p "$SSL_DIR" "$CONF_DIR"

# Check that the configuration exists
if [ ! -f "$CONF_FILE" ]; then
    echo "Error: missing nginx configuration file"
    exit 1
fi

# Replace environment variables in nginx config
echo "Substituting environment variables in nginx configuration..."
envsubst '$DOMAIN_NAME' < "$CONF_FILE" > /tmp/default.conf
mv /tmp/default.conf "$CONF_FILE"

# gen self-signed certificate if not existing
if [ ! -f "$SSL_DIR/${DOMAIN_NAME}.crt" ]; then
    echo "Generating SSL certificate for ${DOMAIN_NAME}..."
    openssl req -x509 -nodes -days 365 \
        -subj "/C=FR/ST=France/L=Paris/O=42/OU=cheyo/CN=${DOMAIN_NAME}" \
        -newkey rsa:2048 \
        -keyout "$SSL_DIR/${DOMAIN_NAME}.key" \
        -out "$SSL_DIR/${DOMAIN_NAME}.crt"
fi

chmod 600 "$SSL_DIR/${DOMAIN_NAME}.key"

echo "Starting NGINX with TLS for ${DOMAIN_NAME}..."
exec nginx -g 'daemon off;'

