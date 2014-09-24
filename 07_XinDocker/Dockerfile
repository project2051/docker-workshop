FROM ubuntu:latest
MAINTAINER 3h4x "ochach@gmail.com"
# Install TOR package dependencies
RUN echo "deb http://deb.torproject.org/torproject.org trusty main" >> /etc/apt/sources.list
RUN gpg --keyserver keys.gnupg.net --recv 886DDD89
RUN gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
RUN apt-get update
RUN apt-get install -y tor tor-geoipdb torsocks privoxy
RUN apt-get install -y chromium-browser
RUN apt-get install -y sudo
# Configure and run privoxy
RUN echo "forward-socks5 / 127.0.0.1:9050 ." > /etc/privoxy/config
RUN echo "listen-address *:8118" >> /etc/privoxy/config
RUN echo "debug 512" >> /etc/privoxy/config
RUN mkdir /var/lib/tor/hidden_service
RUN chown -R debian-tor:debian-tor /var/lib/tor/hidden_service
RUN useradd h4x -m -d /home/h4x -s /bin/bash
ENV DISPLAY :0
# Configure and startup TOR
CMD \
/etc/init.d/tor start && \
bash -c "sudo -i -u h4x http_proxy=\"http://`ifconfig eth0 | grep 'inet addr:' | awk ' { print $2 } ' | cut -f 2 -d\:`:8118\" chromium-browser --no-sandbox http://zqktlwi4fecvo6ri.onion/wiki/index.php/Main_Page > /dev/null 2>&1 &" && \
privoxy --no-daemon /etc/privoxy/config