FROM debian:bullseye

RUN apt-get update -y && apt-get install -y nginx openssl gettext-base

# Copy configuration and script
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./tools/setup.sh /setup.sh

RUN chmod +x /setup.sh

CMD ["/setup.sh"]

