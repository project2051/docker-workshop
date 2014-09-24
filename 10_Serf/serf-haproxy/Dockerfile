FROM debian

RUN apt-get update
RUN apt-get install -y wget unzip supervisor 
RUN apt-get install -y adduser libpcre3

RUN wget http://dl.bintray.com/mitchellh/serf/0.6.3_linux_amd64.zip
RUN unzip 0.6.3_linux_amd64.zip
RUN mv serf /usr/bin

RUN wget http://ftp.at.debian.org/debian-backports//pool/main/h/haproxy/haproxy_1.4.25-1~bpo60+1_amd64.deb
RUN dpkg -i haproxy_1.4.25-1~bpo60+1_amd64.deb
RUN echo "ENABLED=1" > /etc/default/haproxy

ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf
ADD haproxy.cfg /etc/haproxy/haproxy.cfg

ADD serf_join.sh /serf_join.sh
ADD member_join.sh /member_join.sh
ADD member_leave.sh /member_leave.sh
RUN chmod a+x /*.sh

EXPOSE 7946 7373

CMD /etc/init.d/haproxy start && supervisord -n
