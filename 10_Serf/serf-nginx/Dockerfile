FROM debian

RUN apt-get update
RUN apt-get install -y wget unzip supervisor

RUN wget http://dl.bintray.com/mitchellh/serf/0.6.3_linux_amd64.zip
RUN unzip 0.6.3_linux_amd64.zip
RUN mv serf /usr/bin

ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf
ADD serf_join.sh /serf_join.sh


RUN apt-get install -y nginx
ADD nginx.conf /etc/nginx/nginx.conf
ADD docker.png /usr/share/nginx/www/docker.png

EXPOSE 7946 7373

CMD echo "<html><body background='docker.png'>It's me! Your favourite container - `hostname`!<br\></body></html>" > /usr/share/nginx/www/index.html && \
supervisord -n
