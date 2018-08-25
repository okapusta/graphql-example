all: build-backend build-frontend run

build-backend:
	docker build -f ./Dockerfile.backend -t graphql-example.backend .

build-frontend:
	docker build -f ./Dockerfile.frontend -t graphql-example.frontend .

run:
	docker-compose up

teardown:
	docker-compose rm
