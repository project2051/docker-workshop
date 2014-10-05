# Docker

Docker (github.com/docker/docker) is written in GO and uses libvirt (http://libvirt.org/git/), libcontainer (github.com/docker/libcontainer) and LXC (github.com/lxc/lxc)  
It allow us to run 'linux in linux'. In a nutshell it's seperate process pool but it looks like normal virtual machine.  
It runs on top of linux kernel. 
Resources get isolated by cgroup. Both hardware resources like CPU, disk IO, memory, network and software resources by namespace isolation: process tree, mounts, users, network.

## Run

Let's run simple container and check what has happened in OS  
Docker "Hello world!" on  

* Linux  
```
sudo docker run -it ubuntu bash  
```  
* OS X  
You can use either traditional, boot2docker:  
```
boot2docker start  
export DOCKER_HOST=tcp://192.168.59.103:2375
docker run -it ubuntu bash
```  
or https://github.com/noplay/docker-osx
```
docker-osx start
eval `docker-osx env` # It's just exporting DOCKER_HOST
docker run -it ubuntu bash
```
***We highly recommend docker-osx, as it will enable some cool features later on***

The -i switch is for interactive mode and -t is to allocate a pseudo-tty. We strongly encourage you to mess it up and run 
`docker run ubuntu bash`, `docker run -i ubuntu bash`, `docker run -t ubuntu bash`. Learn on your mistakes!  
Docker got loads of switches and commands, not just run. `docker help` is your friend. If in doubt use it!

And now, let's see how bash looks under fedora distro:
```
docker run -it fedora bash 
```
You will see that docker needs to download image of Fedora linux. Therefore, it will just  run bash command inside Fedora. Try running other command, like echo or cat:
```
docker run -it fedora cat /etc/issue
```

After running a container we can see basic info about it with `docker ps`.
```
 CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS              PORTS               NAMES
 c166d7970638        postgres:latest     "/docker-entrypoint.   16 minutes ago      Up 16 minutes       5432/tcp            postgres-db         
```

You have there Container ID but this is just shorter version of real UUID (we will see it in next chapter) but most often you will use just name for your containers as it is most convinient.

### Trick

Use variable (we use BASH) for storing your container UUID so you can easily reuse it.
```
DOCKER_ID=$(docker run -itd ubuntu)  
docker attach $DOCKER_ID
```
Yay! You are in your container even though you don't know it's UUDI.  
  
Next trick is how to exit the container without killing it.  
Normally you would type `exit` or control-D but this would also kill root process of container (in that case /bin/bash with PID 1).  
`ctrl-p + ctrl-q` - will exit the container without killing it.  
Now you can type `docker stop $DOCKER_ID`. This will be end of fun with this container :smile:

## Why Docker is good?
### These are four main pros of Docker
* Size - it's not full VM, it's just a process  
* Speed - lightweight containers have minimal overhead (compare `time docker run ubuntu ifconfig` to `time ifconfig` 
on your laptop. Too slow? Compare Docker to VMWare or VirtualBox)  
* Portability - run it on any linux with kernel > 3.8 and be sure it will behave the same everywhere - Dockerfile  
* Versioning - AUFS  

### but beside that you can find it valuable for your reasons  
* Escape dependecy hell on your laptop
* Continuous integration
* Send Dockerfile via email or xmmp to your friend so you have the same environment
* Quickly modify existing environment (for example: upgrade java version)
* Prototyping

## Topics

### Images

* https://github.com/project2051/warsjawa-docker-workshop/blob/master/02_Images/README.md

### Commiting - Mutable and Immutable containers

* https://github.com/project2051/warsjawa-docker-workshop/blob/master/03_Commit/README.md

### Dockerfile - building image

* https://github.com/project2051/warsjawa-docker-workshop/blob/master/04_Dockerfile/README.md

### Real Life Example

* https://github.com/project2051/warsjawa-docker-workshop/blob/master/05_Real-LifeExample/README.md

### Dockerfile advanced usage

* https://github.com/project2051/warsjawa-docker-workshop/blob/master/06_AdvancedDockerfile/README.md

### X in Docker 

* https://github.com/project2051/warsjawa-docker-workshop/blob/master/07_XinDocker/README.md

### Linking containers

* https://github.com/project2051/warsjawa-docker-workshop/blob/master/08_LinkingContainers/README.md

### FIG

* https://github.com/project2051/warsjawa-docker-workshop/blob/master/09_Fig/README.md

### Serf

* https://github.com/project2051/warsjawa-docker-workshop/blob/master/10_Serf/README.md

  
# Summary
What we have learned so far?  

Commands we know:  

* docker run
* docker ps
* docker attach
* docker stop
* docker help

# Things to check

* docker scratch image -the smallest image avaliable for docker (3.6MB)  
  
