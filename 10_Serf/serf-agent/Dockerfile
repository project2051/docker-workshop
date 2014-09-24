FROM debian

RUN apt-get update
RUN apt-get install -y wget unzip

RUN wget http://dl.bintray.com/mitchellh/serf/0.6.3_linux_amd64.zip
RUN unzip 0.6.3_linux_amd64.zip
RUN mv serf /usr/bin

EXPOSE 7946 7373

CMD serf agent -tag role=serf-agent

