FROM archlinux:latest

ENV LANG=C.UTF-8
ENV TZ=UTC

RUN pacman -Syyu --noconfirm nginx

RUN mkdir -p "/mnt/wordpress" && chmod 755 "/mnt/wordpress"

EXPOSE 80

CMD ["nginx",  "-g",  "daemon off;"]
