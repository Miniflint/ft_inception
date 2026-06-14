FROM archlinux

RUN pacman -Sy --noconfirm zsh nginx vim fastfetch

COPY ./web_page/nginx.conf /usr/local/nginx/conf/nginx.conf

ENTRYPOINT ["bash"]
