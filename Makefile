IMAGE_PREFIX = reynoldsm88/
IMAGE_NAME = image-builder
IMG := $(IMAGE_PREFIX)$(IMAGE_NAME)

build:
	docker build -t $(IMG):latest .

push: build
	docker push $(IMG):latest

docker-clean:
	docker images | grep $(IMG_NAME) | grep -v IMAGE | awk '{print $3}' | xargs docker rmi -f
	docker system prune --force