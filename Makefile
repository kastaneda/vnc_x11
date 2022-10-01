
# Include optional config
# Sample usage: echo "DOCKER_OPTIONS=-e SCREEN_SIZE=1024x768" >> .env

-include .env

PWD := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

run: build data
	docker run -it --rm -p5900:5900 $(DOCKER_OPTIONS) -v $(PWD)/data:/home/user/data kastaneda/vnc_x11 -v /dev/shm:/dev/shm

build:
	docker build -t kastaneda/vnc_x11 ./

data:
	mkdir -p data

.PHONY: run build
