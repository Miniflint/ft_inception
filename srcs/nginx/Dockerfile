FROM archlinux

ENV LANG=C.UTF-8
ENV TZ=UTC

RUN pacman -Sy --noconfirm nginx

EXPOSE 80

CMD ["nginx",  "-g",  "daemon off;"]