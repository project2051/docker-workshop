FROM debian

RUN apt-get update
RUN apt-get install -y wget unzip nginx supervisor

RUN wget http://dl.bintray.com/mitchellh/serf/0.6.3_linux_amd64.zip
RUN unzip 0.6.3_linux_amd64.zip
RUN mv serf /usr/bin

ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf
ADD serf_join.sh /serf_join.sh
ADD nginx.conf /etc/nginx/nginx.conf

EXPOSE 7946 7373

CMD echo "It's me! Your favourite `hostname`!" > /usr/share/nginx/www/index.html && \
supervisord -n
