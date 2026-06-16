FROM archlinux:latest

ENV LANG=C.UTF-8
ENV TZ=UTC

RUN pacman -Syyu --noconfirm nginx

EXPOSE 80

CMD ["nginx",  "-g",  "daemon off;"]
