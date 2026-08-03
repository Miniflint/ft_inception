# Dev doc

## Setup

On a linux machine, preferably a VM, Debian 12.
install docker debian : https://docs.docker.com/engine/install/debian/
```
git clone https://github.com/miniflint/ft_inception
```

Set up .env file like mentionned in README.md
```
nano inception/srcs/.env
```

Edit hosts file to edit 42login.
```
nano /etc/hosts
```


## Run inception
```
cd inception
```

```
make re
```

## Editing inception

In `inception/srcs/requirements` there is the mandatory service containers. their folder are named `conf` and `tools` for entrypoint scripts.

You can use `docker exec -it [CONTAINER_ID] [command]` to execute the said command inside the container id.

Volumes and networks are in `inception/srcs/docker-compose.yml`
