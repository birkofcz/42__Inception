

NAME = Inception
SRC = ./srcs/docker-compose.yml

help:
	@echo "\n [[ Inception makefile help ]]\n"
	@echo "run	  - builds and runs the containers"
	@echo "stop	  - stops the containers"
	@echo "clean	  - stops the containers amd deletes images and volumes"
	@echo "eval	  - cleans before evaluation (as specified in eval sheet)"
	@echo "re	  - cleans and rebuilds\n"

run:
# Build and runs the containers
	docker compose -f $(SRC) up -d --build

stop:
# Stops the running containers
	docker compose -f $(SRC) down

fclean: stop
# Removes unused docker resources
	docker system prune -af 
# Removes the volumes used by the infrastructure
	@echo "\nDeleting volumes:"
	@docker volume rm db wp

eval:
	docker stop $(docker ps -qa);\
	docker rm $(docker ps -qa); \
	docker rmi -f $(docker images -qa); \
	docker volume rm $(docker volume ls -q); \
	docker network rm $(docker network ls -q) 2>/dev/null

re: fclean run