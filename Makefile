.PHONY: up down

up: down
	docker compose up --build -d

down:
	docker compose down