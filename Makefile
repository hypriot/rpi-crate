DOCKER_IMAGE_VERSION=0.47.4
DOCKER_IMAGE_NAME=hypriot/rpi-crate
DOCKER_IMAGE_TAGNAME=$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)

default: build

build:
	docker build -t $(DOCKER_IMAGE_TAGNAME) .
	docker tag -f $(DOCKER_IMAGE_TAGNAME) $(DOCKER_IMAGE_NAME):latest

push:
	docker push $(DOCKER_IMAGE_NAME)

test:
	docker run --rm $(DOCKER_IMAGE_TAGNAME) /bin/echo "Success."

version:
	docker run --rm $(DOCKER_IMAGE_TAGNAME) /bin/bash -c 'echo "Crate.io version $$CRATE_VERSION"'

run1:
	docker run -d -p 4200:4200 -p 4300:4300 -d hypriot/rpi-crate:latest

run2:
	docker run -d -p 4200:4200 -p 4300:4300 -d hypriot/rpi-crate:latest
	docker run -d -p 4201:4200 -p 4301:4300 -d hypriot/rpi-crate:latest

