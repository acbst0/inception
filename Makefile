NAME = docker_app
DOCKER_COMPOSE = docker-compose -f srcs/docker-compose.yml

all:
	$(DOCKER_COMPOSE) up -d --build

clean:
	$(DOCKER_COMPOSE) down

fclean: clean
	$(DOCKER_COMPOSE) down -v

re: fclean all
