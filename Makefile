all: build-backend build-frontend run

build-backend:
	docker build -f ./Dockerfile.backend -t graphql-example.backend .
