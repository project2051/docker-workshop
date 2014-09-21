# Docker Commit

## Namespace isolation check

### Process isolation
```
docker run -it ubuntu bash
```

Let's install htop package inside our container1   

```
apt-get update
apt-get install htop
htop
```
  
What funny can you see in htop?
    
Run container2 with same command `docker run -it ubuntu bash`.
They are completly different containers. Other hostname, ip and of course container1 has htop package while container2 doesn't.  
Let's try to kill htop which is running on container1 from container2. We can't really see it in process list on container2 
but knowing the pid we will try to do it anyways!  
`bash: kill: (67) - No such process`.  
Now we know it's true :)  
  
Kill that process from host   
```
kill `pgrep htop` 
``` 
will be enough to kill htop. It is just a process so you can kill it, strace it, monitor it and see it in /proc/

You can exit container2 by just pressing ctrl-D or `exit`, which will kill the bash shell and kill the container
as this was it's main purpose to serve bash. In other words it will be on as long as bash is running, so killing bash
from docker host will kill the container too.  

## Let's commit

We should have one running container now - container1.  
Let's commit! ```docker commit $(docker ps -q) ubuntu-htop``` - it's that quick!  
We got pretty long hash for our new container but we tagged it as ubuntu-htop. Run new container with htop, 
remember you don't need bash for it `docker run -it ubuntu-htop htop`  
  
What we really did with commit was creating another layer of AUFS with htop installed on top of ubuntu image.  
You can still run unchanged ubuntu, it didn't get overwritten. You can run ubuntu-htop too. You can run as many of 
them as you like ;)

## Immutable containers

Okay so we now how to commit but I discourage you to do this manualy. If you stick with immutable containers then you 
can be assured that container will behave in exactly the same manner here, there and on production!  
  
You want to make changes to running docker? Just don't.  
Prepare new container with updates, new app, new filesystem, new whatever you wish. Just don't change container that 
is working fine.  
  
It will make your life easier in long run!


## Mutable containers

Immutable containers are fine but if we want to check something quick then we really need to get inside.  
You can use ssh for it but why? It take resources, expose another port and is not risk free.  
  
Docker doesn't provide a way to get inside but boy we are lucky, there is https://github.com/jpetazzo/nsenter  
nsenter provides docker-enter, with this script you can enter any container you want by it's ID.  
  
I use it frequently for testing
`nsenter --target $(docker inspect --format {{.State.Pid}} $(sudo docker ps -q | head -n1)) --mount --uts --ipc --net --pid` 
- this command will get you quickly into the last running container.  
  
What is used here and we didn't mention before is docker inspect. Run it. Parse it. Get as much as you want from this json.  

  

# Summary
What we have learned so far?  

Commands we know:  

* docker commit
* docker inspect
* nsenter
* docker-enter
  

# Things to check

* changes in our favourite directory /var/lib/docker/
* network namespace
* users namespace
* mount namespace
* 

# Namespace additional explanation
#### Namespace explanation

## PID
When you run docker container it creates new pid namespace. The command from docker run becomes root process with 
two PIDs - PID 1 in just created namespace and ephemeral PID visible from parent namespace. 
You cannot view or affect siblings nor parent process in new namespace. 
Every new container will have inside root process with PID 1.

## NET
Each net namespace has it's own eth device and lo 127.0.0.1.  
It gives possibility to configure iptables and routing differently on your containers.

## Users
On every containers root user got UID 0 and GID 0 but that is not the same root.
More than that! Network, users, process tree and mounts are isolated by namespace. 

## Mounts
#TODO
