PWD := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

run: build data
	docker run -it --rm -p5900:5900 -v $(PWD)/data:/home/user/data kastaneda/vnc_x11

build:
	docker build -t kastaneda/vnc_x11 ./

data:
	mkdir -p data

.PHONY: run build
