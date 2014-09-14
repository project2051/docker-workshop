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
```boot2docker start```  
```export DOCKER_HOST=tcp://192.168.59.103:2375```    
```docker run -it ubuntu bash```  

The -i switch is for interactive docker and -t is for pseudo-tty. We strongly encourage you to mess it up and run `docker run ubuntu bash`, `docker run -i ubuntu bash`, `docker run -t ubuntu bash`. Learn on your mistakes!  
Docker got loads of switches and commands, not just run. `docker help` is your friend. If in doubt use it!

## Why Docker is good?
### These are four main pros of Docker
* Size - it's not full VM, it's just a process  
* Speed - lightweight containers have minimal overhead (compare `time docker run ubuntu ifconfig` to `time ifconfig` on your laptop. Too slow? Compare Docker to VMWare or VirtualBox)  
* Portability - run it on any linux with kernel > 3.8 and be sure it will behave the same everywhere - Dockerfile  
* Versioning - AUFS  

### but beside that you can find it valuable for your reasons  
* Escape dependecy hell on your laptop
* Continious integration
* Send Dockerfile via email or xmmp to your friend so you have the same environment
* Quickly modify existing environment (for example: upgrade java version)
* Prototyping

## Proof of Isolation

## Topics

### Images

* https://github.com/project2051/warsjawa-docker-workshop/blob/master/02_Images/Docker_Images.md

### Commiting - Mutable and Immutable containers

* https://github.com/project2051/warsjawa-docker-workshop/blob/master/03_Commit/Immutable.md

### Dockerfile - building image

#TODO link
Will be explained with Dockerfile  


### Dockerfile advanced usage

### Linking containers

### FIG

### Serf/


# Summary
What we have learned so far?  

Commands we know:  

* docker run
* docker ps
* docker images
* docker help
  

# Things to check

* docker scratch image -the smallest image avaliable for docker (3.6MB)  
  
