version: "3.7"
services:
  app:
    image: docker-example
    context: ./
    volumes:
      - ./app:/app
  web:
    image: nginx
    ports:
      - "8888:80"
    links:
      - app
    depends_on:
      - app
    volumes:
      - ./config/nginx/application.conf:/etc/nginx/conf.d/default.conf
