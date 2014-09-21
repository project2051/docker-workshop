FROM debian
RUN apt-get update && apt-get -yq install python-pip
RUN apt-get install -yq python-psycopg2
RUN pip install django==1.7
RUN django-admin startproject wickedapp
ADD settings.py wickedapp/wickedapp/settings.py
ADD run_django.sh run_django.sh

CMD \
echo "$DBUSER" && \
echo "$DBNAME" && \
echo "$DBPASSWORD" && \
echo "$POSTGRES_DB_PORT_5432_TCP_ADDR" && \
./run_django.sh
