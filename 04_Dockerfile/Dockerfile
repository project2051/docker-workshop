FROM ubuntu:latest
MAINTAINER i_and_i "me@me.me"

# Package ping installation
RUN apt-get update
RUN apt-get install -y iputils-ping

# Quick edit some config (just a placeholder command :) ) 
RUN echo "some content" > /etc/example_config

# And even more pointless commands...
RUN echo "listen-address *:8118" >> /etc/example_config
RUN echo "debug 512" >> /etc/example_config


# Get it done!
CMD echo "Hi! " && \
  ping google.com
