#!/bin/bash -x
if [[ -z "$DBUSER" ]] ; then
    DBUSER=django
fi
 
if [[ -z "$DBNAME" ]] ; then
    DBNAME=wickedapp
fi
if [[ -z "$DBPASSWORD" ]] ; then
    DBPASSWORD=$RANDOM
fi
 
sed -i.bak s/\$DBUSER/$DBUSER/ /wickedapp/wickedapp/settings.py
sed -i.bak s/\$DBNAME/$DBNAME/ /wickedapp/wickedapp/settings.py 
sed -i.bak s/\$DBPASSWORD/$DBPASSWORD/ /wickedapp/wickedapp/settings.py 
sed -i.bak s/\$POSTGRES_DB_PORT_5432_TCP_ADDR/$POSTGRES_DB_PORT_5432_TCP_ADDR/ /wickedapp/wickedapp/settings.py 

python /wickedapp/manage.py syncdb
python /wickedapp/manage.py runserver 0.0.0.0:8000
