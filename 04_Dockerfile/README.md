# Dockerfile

To store the container config in a wiser way and get closer to 'Infrastructure-as-a-Code' concept, we use Dockerfiles - text files with set of commands that strictly describe, how the container should be built.

## Build it!

In this folder you will find an example Dockerfile. Have a quick skim at it, and try to guess what it will create, before we will dive into its  syntax. Let's try to build out container:
```
docker build .
```
  
***NOTE:*** every command in Dockerfile will create intermediate container.

And run it:
```
docker run -it <container_id>
```
  
***Tag your builds***, it might come handy to use `docker build -t warsjawa-workshop-04 .`, so you will not have to remember UID of it. Use it in other docker commands!  
For example `docker run -it warsjawa-workshop-04`
  
***Docker will use previously built containers as cache*** if you ran `docker build .` more than once.  
You can change this behaviour with flag `docker build --no-cache=true .`
  
***You can force docker to remove intermediate containers*** with flag --force-rm=true

### Play with Dockerfile

Delete any RUN command in Dockerfile and pay attention to what will be used from cache and which new intermediate containers will be created. Build it again, did it use cache?
  
Build Dockerfile with any set of flags that we have presented.  

## What are the pros of Dockerfile?
* It's CODE - Can be versioned, reviewed, easily distributed (imagine a VM image now)
* Easy to read, write - maintain
* Can be added to project repository and become part of automated test run
