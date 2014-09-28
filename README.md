# Warsjawa Docker Workshop

This is a repository which will be used for a essential docker training held at Warsjawa 2014 conference by [mieciu](https://github.com/mieciu) and [3h4x](https://github.com/3h4x).

We divided this repo in subdirectories, each of it contains practical examples of what and how can be done with docker.

Might be not really self-explanatory, because its just integrated part of our workshop :smile:  

  * Please make sure that ***you have at least 8 GiBs of free disk space***, so that you won't fill up your disk with container images ( this is due to downloading many different docker images which we will use in our examples and excercises. Of course you can remove these images right after moving from one excercise to another and/or rebuilt the container later on, but this will let us stay calm :smile:)



## ***Best setup***

You will have two virtual machines (you can use any virtualziation you want).  
This can get messy :smile:
  
### First one  
  * just linux (kernel >=3.8) and Docker installed
  
### Second one  
  * just linux (kernel >=3.8) and Docker installed
  * fig -> http://www.fig.sh/install.html
  * serf -> http://www.serfdom.io/downloads.html
  * all docker images built, run script download_deps_before.workshop.sh with root in this repository  

## ***Setup***

VM's would help but if not you can always have it all on your laptop, docker, fig, serf and all images.
If you use ***Mac OS X*** and don't want VM's -> https://github.com/noplay/docker-osx
  
  
  
***Note:*** 
`download_deps_before.workshop.sh`  
The script will help you make sure that docker is up and running, we want to go swiftly through excercises, it will also download everyting before so we won't have to rely on the internet connection.

***Note:*** 
There is a repo on github with useful aliases for docker  
https://github.com/project2051/dockerkurwa
