
# Include optional config
#
# Sample usage:
# echo 'DOCKER_OPTIONS="-e SCREEN_SIZE=1024x768 -e KIOSK=url -v /dev/shm"' > .env
#
# Variable SCREEN_SIZE sets the X11 display geometry
# Variable KIOSK is used to run Firefox in Kiosk mode
#
# "--shm-size 2g" will increase shared memory to 2 Gb (recommended)
# "-v /dev/shm" will use shared memory of the host, use with caution!

-include .env

PWD := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

run: build data
	docker run -it --rm -p5900:5900 $(DOCKER_OPTIONS) -v $(PWD)/data:/home/user/data kastaneda/vnc_x11

build:
	docker build -t kastaneda/vnc_x11 ./

data:
	mkdir -p data

.PHONY: run build
