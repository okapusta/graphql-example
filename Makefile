all: run

build: backend frontend

backend:
	docker build -f ./dockerfiles/backend/Dockerfile -t graphql-example.backend .

frontend:
	docker build -f ./dockerfiles/frontend/Dockerfile -t graphql-example.frontend .

run:
	docker-compose up

teardown:
	docker-compose rm -v
