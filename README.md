# Warsjawa Docker Workshop

This is a repository which will be used for a essential docker training held at Warsjawa 2014 conference by [mieciu](https://github.com/mieciu) and [3h4x](https://github.com/3h4x).

We divided this repo in subdirectories, each of it contains practical examples of what and how can be done with docker.

Might be not really self-explanatory, because its just integrated part of our workshop :smile:

***Note:*** Please do these things just before attending workshop:

* Please make sure that ***you have at least 8 GiBs of free disk space***, so that you won't fill up your SSD with container images ( this is due to downloading many different docker images which we will use in our examples and excercises. Of course you can remove these images right after moving from one excercise to another and/or rebuilt the container later on, but this will let us stay calm :smile:)
* Install docker on your machine (or https://github.com/noplay/docker-osx , if on Mac OS X )
* Install fig in any way that suits you http://www.fig.sh/install.html , and also get Serf http://www.serfdom.io/downloads.html
* Execute ``` ./download_deps_before.workshop.sh```
  This script will build all the containers, which will be running during the workshop. It's crucial because:
  * you will be sure that docker is up and running, so we won't waste time on installation and download and carry on with   excercises
  * it will also download hundreds of MBytes of images, packages, and anything, so that we don't have to rely on the internet connection
