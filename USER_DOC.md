# User doc

This implementation of inception offers extra services from the base subject.

## Required services

- Wordpress  (Website + management)
- MariaDB    (DB server)
- NGINX      (Web server)

## Additional services

- Adminer    (Database management service)
- Redis      (Cache for quick DB response)
- Proftpd    (File transfer protocol service)
- Cron       (Used for time based backups)
- Portfolio  (Static website)

## Running Inception

```make re```

```make down```

```make up```

```make clean```

### Manage credentials

Setup an `.env` file in /srcs/ (Check README.md)

### Docker status

```
docker ps
```

### Wordpress
```
https://trgoel.42.fr
https://trgoel.42.fr/wp-admin
```
