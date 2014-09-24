## FIG

First of all, we need to install FIG, here you can find some instructions http://www.fig.sh/install.html.

**Note**: For OSX users, to take the advantages of FIG, we highly recommend running docker via https://github.com/noplay/docker-osx. Some features, which can be found in FIG, such as volume mapping, won't work in boot2docker.

FIG makes linking many different containers very easy. All we have to do is to describe our environment in a .yml file. No big deal at all. 

We will be running a web app built on Flask and Redis. Remeber linking containers inprevious excercise? Can you imagine what would happen, if number of Redis instances grows up to 4? That's why we need a tool like FIG, which will do most of the crappy, repeatable, human-keyboard-like work for us :smile:

## Let's do this

Our goal would be to build web application separated into two containers - one of them will cover the python-flask-based webapp responding to some HTTP requests, and the second container will be our Redis instance - key-value store in backend.

Please go to `example_1` directory.
Source code of the app can be found in `our_web_app.py`.
We still have a Dockerfile, which will be a base to build webapp container. Take a closer look on its code.
As a Redis container, we will use the default image from Docker Hub.

Now let's take a look on how everything of our webapp ecosystem is defined in `fig.yml` file. We can run it, and check out how it works:
```
fig up
```

We strongly encourage encourage you to play around with fig. First of all, meet its most useful options and switches:
* `fig up -d` will let you to run your container stack in detached mode. However, all the logs can be still easily browsed later on with `fig logs`. 
* `fig ps` will show you all running containers
* SCALE DAT! Run `fig scale redis=3` to bring up more or less instances of certain service
* Typing just `fig` with no options will display some help and list of available commands. Just in case you forget some obvious `rm` `start` `stop` `build` actions.

