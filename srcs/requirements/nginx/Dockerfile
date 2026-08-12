FROM debian:bullseye

RUN apt-get update -y && apt-get install -y nginx openssl gettext-base \
    && rm -rf /var/lib/apt/lists/* && apt-get clean

# Copy configuration and script
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./tools/setup.sh /setup.sh

RUN chmod +x /setup.sh

EXPOSE 443

CMD ["/setup.sh"]

