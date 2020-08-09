Yet another dockerized X11
==========================

```bash
docker build -t kastaneda/vnc_x11 ./

docker run -it --rm -p5900:5900 kastaneda/vnc_x11 &
sleep 1
vncviewer 127.0.0.1

```
