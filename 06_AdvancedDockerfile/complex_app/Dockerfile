FROM ubuntu:14.04
RUN echo 'deb http://us.archive.ubuntu.com/ubuntu/ trusty universe' >> /etc/apt/sources.list
RUN echo
RUN apt-get -y update
RUN apt-get -y upgrade


# Install all prerequisites
RUN apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get -y update
RUN apt-get -y install python-django-tagging python-simplejson python-memcache python-ldap python-cairo  \
                       python-psycopg2 python-support python-pip gunicorn supervisor nginx-light nodejs \
                       git wget curl openjdk-7-jre build-essential python-dev


# Install PostgreSQL for Graphite
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y -q postgresql-9.3

# /etc/ssl/private can't be accessed from within container for some reason
# (@andrewgodwin says it's something AUFS related)
RUN mkdir /etc/ssl/private-copy; mv /etc/ssl/private/* /etc/ssl/private-copy/; rm -r /etc/ssl/private; mv /etc/ssl/private-copy /etc/ssl/private; chmod -R 0700 /etc/ssl/private; chown -R postgres /etc/ssl/private

ADD ./postgres/postgresql.conf /etc/postgresql/9.3/main/postgresql.conf
ADD ./postgres/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
RUN chown postgres:postgres /etc/postgresql/9.3/main/*.conf
ADD ./postgres/run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

VOLUME ["/var/lib/postgresql"]

# Install Elasticsearch
RUN cd ~ && wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.2.deb
RUN cd ~ && dpkg -i elasticsearch-1.3.2.deb && rm elasticsearch-1.3.2.deb

# Install StatsD
RUN mkdir /src && git clone https://github.com/etsy/statsd.git /src/statsd && cd /src/statsd && git checkout v0.7.1

# Install Whisper, Carbon and Graphite-Web
RUN pip install Twisted==11.1.0
RUN pip install Django==1.5
RUN pip install whisper
RUN pip install --install-option="--prefix=/var/lib/graphite" --install-option="--install-lib=/var/lib/graphite/lib" carbon
RUN pip install --install-option="--prefix=/var/lib/graphite" --install-option="--install-lib=/var/lib/graphite/webapp" graphite-web

# Install Grafana
RUN mkdir /src/grafana && cd /src/grafana &&\
    wget http://grafanarel.s3.amazonaws.com/grafana-1.7.0.tar.gz &&\
    tar xzvf grafana-1.7.0.tar.gz --strip-components=1 && rm grafana-1.7.0.tar.gz

# Configure Elasticsearch
ADD ./elasticsearch/run /usr/local/bin/run_elasticsearch
ADD ./elasticsearch/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
VOLUME ["/data"]

# Confiure StatsD
ADD ./statsd/config.js /src/statsd/config.js

# Configure Whisper, Carbon and Graphite-Web
ADD ./graphite/initial_data.json /var/lib/graphite/webapp/graphite/initial_data.json
ADD ./graphite/local_settings.py /var/lib/graphite/webapp/graphite/local_settings.py
ADD ./graphite/carbon.conf /var/lib/graphite/conf/carbon.conf
ADD ./graphite/storage-schemas.conf /var/lib/graphite/conf/storage-schemas.conf
ADD ./graphite/storage-aggregation.conf /var/lib/graphite/conf/storage-aggregation.conf
RUN mkdir -p /var/lib/graphite/storage/whisper
RUN touch /var/lib/graphite/storage/graphite.db /var/lib/graphite/storage/index
RUN chown -R www-data /var/lib/graphite/storage
RUN chmod 0775 /var/lib/graphite/storage /var/lib/graphite/storage/whisper
RUN chmod 0664 /var/lib/graphite/storage/graphite.db

# Configure Grafana
ADD ./grafana/config.js /src/grafana/config.js
ADD ./grafana/dashboard.json /src/grafana/app/dashboards/default.json
ADD ./nginx/nginx.conf /etc/nginx/nginx.conf
ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD crontab /crontab


# Grafana
EXPOSE  80

# StatsD UDP port
EXPOSE  8125/udp

# StatsD Management port
EXPOSE  8126

# Carbon listen port
EXPOSE 2003

CMD /etc/init.d/postgresql start && sudo -u postgres createuser -E -w graphite && \
  echo "ALTER USER graphite WITH PASSWORD 'graphite';" | psql -U postgres && \
  echo "CREATE DATABASE graphite OWNER graphite;" | psql -U postgres && \
  cd /var/lib/graphite/webapp/graphite && python manage.py syncdb --noinput && \
  /etc/init.d/postgresql stop && \
  cat /crontab | crontab - && \
  chown -R elasticsearch:elasticsearch /data && \
  /etc/init.d/supervisor start
