# Image and container names
IMAGE_NAME = hello-python
CONTAINER_NAME = hello-python-container

# Default target, shows help message
help:
	@echo "Available targets:"
	@echo "  build      - Build the Docker image"
	@echo "  run        - Run the Docker container"
	@echo "  clean      - Delete the Docker container"
	@echo "  fclean  - Delete both the Docker container and the image"

# Build the Docker image
build:
	@docker build -t $(IMAGE_NAME) .

# Run the Docker container
run:
	@docker run --name $(CONTAINER_NAME) $(IMAGE_NAME)

# Delete the Docker container
clean:
	@docker rm -f $(CONTAINER_NAME) || true

# Clean everything: stops and removes the container, and removes the image
fclean: clean
	@docker rmi -f $(IMAGE_NAME) || true