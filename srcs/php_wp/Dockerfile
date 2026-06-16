FROM archlinux:latest

ENV LANG=C.UTF-8
ENV TZ=UTC

RUN pacman -Syyu --noconfirm wordpress php

EXPOSE 9000

ENTRYPOINT "/bin/bash"
