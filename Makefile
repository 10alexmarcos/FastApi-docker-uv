.PHONY: build run

# Variables
IMAGE_NAME = uvproduction
CONTAINER_NAME = uvprodcontainer
PORT = 8000

init:
	colima start --runtime docker
	
build:
	docker build --tag $(IMAGE_NAME) .

run:
	docker run -p $(PORT):$(PORT) --name $(CONTAINER_NAME) $(IMAGE_NAME)

clean:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

rebuild: clean build