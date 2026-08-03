*This project has been created as part of the 42 curriculum by nrey*

## Description

42's Inception is a project to learn the basics of Docker, docker-compose, and configuration files

## Instructions

A linux VM (Debian was used here), Docker installed on VM. Your `/etc/hosts` file edited to set up domain names.

*- /etc/hosts*
```
trgoel@vbox:~/inception$ cat /etc/hosts
127.0.0.1	localhost
127.0.1.1	vbox.myguest.virtualbox.org	vbox
127.0.0.1	trgoel.42.fr
```

You will have to set your own environment variables in `inception/srcs/.env` to make it like this :

*- inception/srcs/.env* 
```
# DOMAIN
DOMAIN_NAME=[XXXXX].42.fr

# DB
MYSQL_ROOT_PASSWORD=[XXXXX]
MYSQL_DATABASE=wordpress
MYSQL_USER=[XXXXX]
MYSQL_PASSWORD=[XXXXX]

# WORDPRESS
WP_ADMIN_USER=[XXXXX]
WP_ADMIN_PASSWORD=[XXXXX]
WP_ADMIN_EMAIL=[XXXXX]@[XXXXX].42.fr
WP_USER=[XXXXX]
WP_USER_PASSWORD=[XXXXX]
WP_USER_EMAIL=[XXXXX]@[XXXXX].42.fr
```
replace \[XXXXX\] with your variables

## Resources

Wordpress website for their required configs, nginx for their default config and how to handle/generate the certificates, and a bit of AI for setting up mariaDB.
sadly when i started wordpress had an update which ruined the whole config and prevented mariaDB from working as intended

## My inception

*Virtual Machines vs Docker*

Docker containers mainly are used for running a single application on any OS whereas a virtual machine is there to create an entirely new system.

the difference is that docker are isolated user-space instances when virtual machine run on actual hardware

*Secrets vs Environment Variables*

Environment variables are a usually meant to be used for general configuration settings such as the lang, region, timezone etc
Secrets are (technically, not in this project) encrypted, hidden private keys, or credentials

*Docker Network vs Host Network*

Docker offers it's own network system, you can decide which containers can communicate with who in `docker-compose.yml`.
Host Network doesn't give as much flexibility about which containers communicate to who easily without having to create subnet

*Docker Volumes vs Bind Mounts*

Both solutions offer easy access to a drive/folder, but using Docker will let you choose explicitly which container has access to the volumes you wish. My implementation of inception has the following :

- A wordpress volume.
- A mariadb container that can only access the db and not the wordpress files volume.

Bind mount force the user to choose a folder.
Volumes is like saying "do whatever you wanna do but make sure x and y service can communicate through this volume"
