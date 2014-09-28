# X windows in Docker

## Your desktop in Docker container?

Sounds silly but people are doing stuff like this as proof of concept and to test how much they can squeeze from that technology.

## How?

So what options we have to run X applications?  
We can use old good VNC `docker run -p 5900 creack/firefox-vnc x11vnc -forever -usepw -create` - made by creack.  
But it isn't really nice and efficient. You need to have vnc installed and it always prompts for password.  
  
The other thing that you can do is redirect your X socket to container by variable `XSOCK=/tmp/.X11-unix/X0`.

## Application as a container

Why it might be usable?  
For example Tor browser that protects your privacy and leaves no trace when you finish using it.
```
docker build -t onion-browser .
XSOCK=/tmp/.X11-unix/X0
docker run -it -v $XSOCK:$XSOCK onion-browser
```

After a bit Hidden Wiki should show up after refresh.
