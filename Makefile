NAME = Inception
SRC = ./srcs/docker-compose.yml

all: $(NAME)

$(NAME):
	docker compose -f $(SRC) up -d --build

clean:
	docker compose -f $(SRC) down

fclean: clean
	docker system prune -af
	@echo "\nDeleting volumes"
	@docker volume rm db wp

re: fclean $(NAME)
