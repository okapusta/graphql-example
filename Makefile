all: run

build-backend:
	docker build -f ./dockerfiles/backend/Dockerfile -t graphql-example.backend .

build-frontend:
	docker build -f ./dockerfiles/frontend/Dockerfile -t graphql-example.frontend .

run:
	docker-compose up

teardown:
	docker-compose rm -v
