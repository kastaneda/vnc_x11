Yet another dockerized X11
==========================

```sh
docker run --rm -p5900:5900 -e SCREEN_SIZE=1024x768 kastaneda/vnc_x11 &
sleep 2
vncviewer 127.0.0.1
```

Read `Makefile` for more options.

---

The conversation started there:
<https://twitter.com/SilentImp/status/1633576099388215296>


```sh
# Run the container
docker run --rm \
    -v $(pwd):/home/user/tmp_data \
    -p5900:5900 -e SCREEN_SIZE=1024x768 \
    kastaneda/vnc_x11 &

# On this step you can use vncviewer and see what is going on
# But it is not required

# Open shell to the running container
docker exec -it $(docker ps | grep kastaneda/vnc_x11 | awk '{ print $1 }') /bin/bash

# Do some X11 magic :)
export DISPLAY=:0.0
firefox &
sleep 5
xdotool key F11; sleep 2
xdotool key F12; sleep 2
xdotool mousemove 900 650; sleep 1
xdotool click 5; sleep 1
xdotool click 5; sleep 1
import -window root tmp_data/screenshot.png 
```