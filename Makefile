include .env
export $(shell sed 's/=.*//' .env)

CONTAINER_NAME=ai-container

.PHONY: help up down run logs clean

help:
	@echo "Comandos disponíveis:"
	@echo "  make up     - Subir o container"
	@echo "  make down   - Derrubar o container"
	@echo "  make run    - Baixar e rodar o modelo definido no .env"
	@echo "  make logs   - Ver os logs do container"
	@echo "  make clean  - Remover container e volumes"

up:
	docker-compose up -d

down:
	docker-compose down

run:
	docker-compose run --rm ai-model /app/scripts/download_models.sh && docker-compose up -d

logs:
	docker logs -f $(CONTAINER_NAME)

clean:
	docker-compose down -v && rm -rf models/*
