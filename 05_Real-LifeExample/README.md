## Real-Life Example

Imagine a situation, in which our job is to write some scripts, that will manipulate a ready-made, existing program, 
such as Jenkins. Hopefully, Jenkins provides RESTful API to perform some administrative tasks. Our situation can 
be even more complex -  we don't like to install any Jenkins on our computer to have a safe testbed. 
We don't event want to install Java as well. We might be running another distro than our production server.

Let's bring to the action container, which, using Ubuntu image, will fire up the Jenkins instance. After our work 
with its API we will easily cleanup our environment, and in case of further work - with a Dockerfile our test 
environment will be easy to recreate.

Let's build and run our container...
```
docker build .
```
...run it...
```
docker run -it -p 8080:8080 <image_id>    # -p switch needed with boot2docker
```

... And voila! Our Jenkins API is ready for the first requests at either http://<boot2docker_vm_ip>:8080 (boot2docker) or at http://localhost:8080 (linux) or at http://localdocker:8080 (docker-osx).
Using OS X with boot2docker the -p (publish) flag is necessary, as we need to (p)ublish the containers port to the lightweights VM interface to be accessable from our laptop.

Docker container's network interfaces are bridges, same ones as you can setup with KVM/VMWare/VirtualBox machine. Packets are 'switched' over these interfaces - that give us warranty, that the TCP/IP stack communication with a container works exactly like between two virtual hosts. 

As you can see from now - maintaining, moving your environment from one workstation to another haven't ever been so easy :smile:
