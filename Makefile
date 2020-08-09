run: build
	docker run --rm -p5900:5900 kastaneda/vnc_x11

build:
	docker build -t kastaneda/vnc_x11 ./

.PHONY: run build
