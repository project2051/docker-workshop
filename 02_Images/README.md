# Docker Images

Docker uses a graph structure to store versioned file system layers and relationships between them.

This funny command will visualize this structure:
```
docker images -viz | dot -Tpng -o docker.png
```


## Official images
We use ubuntu image, but this is just an example. There is repository with hundreds of other distros and ready to use images.  

Official:  

* `docker pull debian`  
* `docker pull ubuntu`  
* `docker pull fedora`  
* `docker pull centos`  
* `docker pull node`  
* `docker pull redis`  
* `docker pull mongo`  
* `docker pull nginx`  
* `docker pull busybox`  
* etc...

There's more:  

* `docker pull ubuntu:12.04`
* `docker pull ubuntu:12.10`
* `docker pull ubuntu:14.04`
* etc...

## Searching for images

Let's assume we want application that is not on our list, like for example jenkins. We can look for it with `docker search jenkins`  
Let't have a closer look on the results:
```
    root@debian:/var/lib/docker# docker search jenkins  
    NAME                                             DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED  
    jenkins                                          Official Jenkins Docker image                   61        [OK]         
    orchardup/jenkins                                                                                17                   [OK]  
    aespinosa/jenkins                                Sets up a container with jenkins installed...   10                   [OK]  
    evarga/jenkins-slave                             This is a basic container to be used as a ...   5                    [OK]  
    zaiste/jenkins                                                                                   4                    [OK]  
```    
We got quite a list of jenkins images. **Official** build comes always from a company or organization that created it. 
Official build will always be one word, after colon you will have tag/version of build. **Unofficial** builds are named in the pattern of <maintainer>/<image_name>.  
Which one to pick?  
It depends what you expect. Try it. You can always dig deeper, go to github and check sources (when it's automated).  

## Pull

Lets check what images we actually have on our host - `docker images`. You should see ubuntu image already downloaded but wait, there's more!  
Try `docker images -v`.  
Why did it download those intermediate containers, why does it need them?  
It is all because of layers and how Union File System works - https://docs.docker.com/terms/layer/

Have a look at /var/lib/docker/repositories-aufs which is basically the information that `docker images` gives us. Does the graph from the beginning of this excercise look more familiar now? :smile:


## Let's mess with the image!

Find in `/var/lib/docker/aufs/diff` your ubuntu image and check what it contains.  

Run bash in ubuntu container, and execute in `/` directory of this container `echo 'You Like Docker. Docker Likes You.' >> ./etc/issue`
  
Try `docker run -it ubuntu cat /etc/issue`  

Can you see your changes?

## Removing images

After a while you can have quite large Docker Image repository. When you have intermediate containers it can get quite complicated.  
Container is created when it's executed with run, even when you doing just one command, exit container and never look at it again.  
Simple `docker rmi ubuntu` won't work now. Let's fix it!  
  
Check what images you have `docker images` and nevertheless try to delete ubuntu `docker rmi ubuntu`.  
Error? Just as we said so.  
  
`docker images -a | grep _conflicting_container_` - wait, it's not here...  We will talk about commiting more onward but for now you can find conflicting container here `docker ps -a`.  
Delete every commited container `docker rm $(docker ps -aq)`. Got it!  
Now `docker rmi ubuntu`. **Success!**  
  
We used two new flags here: -a (all) and -q (quiet, show just IDs). They come in handy so you can leave your awk and sed skills at home.  
  
So our command to remove all images will look like `docker rm $(docker ps -aq) && docker rmi $(docker images -q)`  
We delete all commited containers and then we delete all images.
  
## Stop messing with the image!
You can modify your containers by hand but all the stuff you can do via docker and namespaces.

`docker pull ubuntu`  
Again `docker run -it ubuntu cat /etc/issue`. All is back to normal!

## Docker Index
If we want to find more information about docker images we can visit Docker Index
```
https://registry.hub.docker.com/
```


# Summary
What we have learned so far?  

Commands we know:  

* docker ps
* docker pull
* docker images
* docker rm
* docker rmi
  

# Things to check

* `sudo baobab /var/lib/docker`  
* `docker images --tree`
* `docker images -viz | dot -Tpng -o docker.png`
