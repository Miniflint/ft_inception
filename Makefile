
CMD := $(shell docker ps -a -q)

all:
	docker compose -f srcs/docker-compose.yaml --env-file ./srcs/.env up -d --build

clean:
	-docker stop $(CMD)
	-docker rm $(CMD) 
	docker system prune -a --volumes -f

.PHONY: all re clean
