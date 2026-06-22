FROM archlinux:latest

ENV LANG=C.UTF-8
ENV TZ=UTC

RUN pacman -Syyu --noconfirm mariadb

RUN mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql

RUN mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

COPY "./scripts/server.conf" "/etc/my.cnf.d/server.cnf"
COPY "./scripts/exec.sh" "/"
RUN chmod +x "/exec.sh"

EXPOSE 3306

CMD ["/exec.sh"]
