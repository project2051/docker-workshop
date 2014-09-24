# Warsjawa Docker Workshop

This is a repository which will be used for a essential docker training held at Warsjawa 2014 conference by [mieciu](https://github.com/mieciu) and [3h4x](https://github.com/3h4x).

We divided this repo in subdirectories, each of it contains practical examples of what and how can be done with docker.

Might be not really self-explanatory, because its just integrated part of our workshop :smile:

***Note:*** Please do this two things just before attending workshop:

* Install docker on your machine (or https://github.com/noplay/docker-osx , if on Mac OS X )
* Install fig in any way that suits you http://www.fig.sh/install.html
* Execute ``` ./download_deps_before.workshop.sh```
  This script will build all the containers, which will be running during the workshop. It's crucial because:
  * you will be sure that docker is up and running, so we won't waste time on installation and download and carry on with   excercises
  * it will also download hundreds of MBytes of images, packages, and anything, so that we don't have to rely on the internet connection
