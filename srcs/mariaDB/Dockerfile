FROM archlinux:latest

ENV LANG=C.UTF-8
ENV TZ=UTC

RUN pacman -Syyu --noconfirm mariadb

EXPOSE 3306

ENTRYPOINT ["/bin/bash"]
