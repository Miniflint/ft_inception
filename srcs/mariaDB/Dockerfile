FROM archlinux:latest

ENV LANG=C.UTF-8
ENV TZ=UTC

RUN pacman -Syyu --noconfirm mariadb-server

RUN mkdir -p "/var/lib/mysql" && \
    chmod 755 -R "/var/lib/mysql"

RUN mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
VOLUME ["/var/lib/mysql"]

COPY "./scripts/server.conf" "/etc/my.cnf.d/server.cnf"
COPY "./scripts/exec.sh" "/"
RUN chmod +x "/exec.sh"

EXPOSE 3306

CMD ["/exec.sh"]
