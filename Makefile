NAME=inception

all: up

build:
	docker compose -f srcs/docker-compose.yml build --no-cache

up:
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

clean:
	docker compose -f srcs/docker-compose.yml down --rmi all -v

re: clean down build up

