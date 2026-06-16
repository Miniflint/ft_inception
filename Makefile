
all:
	docker compose -f srcs/docker-compose.yaml up -d --build

clean:
	docker system prune -a --volumes

.PHONY: all re clean
