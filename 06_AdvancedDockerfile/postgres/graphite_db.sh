#!/bin/bash

POSTGRESQL_BIN=/usr/lib/postgresql/9.3/bin/postgres
POSTGRESQL_CONFIG_FILE=/etc/postgresql/9.3/main/postgresql.conf
POSTGRESQL_SINGLE="sudo -u postgres $POSTGRESQL_BIN --single --config-file=$POSTGRESQL_CONFIG_FILE"

/etc/init.d/postgresql start && sudo -u postgres createuser -E -w graphite && $POSTGRESQL_SINGLE <<< "ALTER USER graphite WITH PASSWORD 'graphite';" && $POSTGRESQL_SINGLE <<< "CREATE DATABASE graphite OWNER graphite;"