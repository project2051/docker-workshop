FROM ubuntu
RUN apt-get -y update
RUN apt-get -y upgrade

RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y -q postgresql-9.3 supervisor

# /etc/ssl/private can't be accessed from within container for some reason
# (@andrewgodwin says it's something AUFS related)
RUN mkdir /etc/ssl/private-copy; mv /etc/ssl/private/* /etc/ssl/private-copy/; rm -r /etc/ssl/private; mv /etc/ssl/private-copy /etc/ssl/private; chmod -R 0700 /etc/ssl/private; chown -R postgres /etc/ssl/private

ADD ./postgres/postgresql.conf /etc/postgresql/9.3/main/postgresql.conf
ADD ./postgres/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
RUN chown postgres:postgres /etc/postgresql/9.3/main/*.conf
ADD ./postgres/run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME ["/var/lib/postgresql"]

EXPOSE 5432 

RUN /etc/init.d/postgresql start && sudo -u postgres createuser -E -w graphite && \
    echo "ALTER USER graphite WITH PASSWORD 'graphite';" | psql -U postgres && \
    echo "CREATE DATABASE graphite OWNER graphite;" | psql -U postgres && \
    /etc/init.d/postgresql stop 

#    /etc/init.d/supervisor start
CMD ["/usr/bin/supervisord"]    
