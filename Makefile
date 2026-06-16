
CMD := $(shell docker ps -a -q)

all:
	docker compose -f srcs/docker-compose.yaml up -d --build

clean:
	docker stop $(CMD)
	docker rm $(CMD)
	docker system prune -a --volumes

.PHONY: all re clean
