## FIG

First of all, we need to install FIG, here you can find some instructions http://www.fig.sh/install.html.

FIG makes linking many different containers very easy. All we have to do is to describe our environment in a .yml file. No big deal at all. 

We will be running a web app built on Flask and Redis. Remeber linking containers inprevious excercise? Can you imagine what would happen, if number of Redis instances grows up to 4? That's why we need a tool like FIG, which will do most of the crappy, repeatable, human-keyboard-like work for us :smile:
