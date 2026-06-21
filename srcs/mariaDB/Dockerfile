FROM archlinux:latest

ENV LANG=C.UTF-8
ENV TZ=UTC

RUN pacman -Syyu --noconfirm mariadb

RUN mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql

RUN mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

EXPOSE 3306

CMD ["mariadbd", "--bind-address=0.0.0.0"]
ENTRYPOINT ["/bin/bash"]
