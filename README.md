Yet another dockerized X11
==========================

```bash
docker run --rm -p5900:5900 -e SCREEN_SIZE=1024x768 kastaneda/vnc_x11 &
sleep 2
vncviewer 127.0.0.1
```
