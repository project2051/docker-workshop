# Linking

While everything on one container might sound tempting, it's not the best option. Application can misbehave if it is separated from other components and you want as much production environment resemblance as possible. 
Linking is like creating a network connection between containers.  
But wait a second, we can expose a port on a container. Why link? You can use -p and -P flags but sooner or later it turns out it's not enough. Linking gives you the power to **automate it** and create **dynamic** environments!

## Django example

For a starter we have django application. We don't want it to sit on top of sqlite nor mysql. We want seperate container with postgres

`docker run --name postgres-db -d postgres`  
Database is now running, we don't care about it's IP address.  
Now we build Dockerfile in 08_LinkingContainers and run it.  
`docker run --name django --link postgres-db:postgres-db django`  
`docker run --link postgres-db:postgres-db -it -e DBUSER=postgres -e DBNAME=postgres -p 8000:8000 django`  
  
After few tricky questions we got our Django application working but how did it happen?  
Let's look closer to run_django.sh. What we have is just bash variables that are changed with sed. 

## Variables
What actually can we get from linking?  
Docker should tell us that with `docker run --link postgres-db:postgres-db -it django env`

* POSTGRES_DB_PORT=tcp://172.17.0.2:5432
* POSTGRES_DB_PORT_5432_TCP=tcp://172.17.0.2:5432
* POSTGRES_DB_PORT_5432_TCP_ADDR=172.17.0.2
* POSTGRES_DB_PORT_5432_TCP_PORT=5432
* POSTGRES_DB_PORT_5432_TCP_PROTO=tcp
* POSTGRES_DB_NAME=/distracted_wright/postgres-db
* POSTGRES_DB_ENV_LANG=en_US.utf8
* POSTGRES_DB_ENV_PG_MAJOR=9.3
* POSTGRES_DB_ENV_PG_VERSION=9.3.5-1.pgdg70+1
* POSTGRES_DB_ENV_PGDATA=/var/lib/postgresql/data

Awesome. That is a lot of useful information! If you look at a container we just created (inspect) then you will see in HostConfig  
```
        "Links": [
                           "/postgres-db:/tender_blackwell/postgres-db"
                       ],
```
  
In config we will have variables that we just created:  
```
        "Env": [
            "DBUSER=postgres",
            "DBNAME=postgres",
            "HOME=/",
            "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
        ],
```  
  
So this is where the magic come from and if we really want then we can use it to build our container for purpose of linking.

## Play with fire
Our idea is that you should now have knowledge to deploy your application with use of linked containers.

## What's next?
Linking is really awesome... for a while ... but then you realize that if you got environment that requires 6 containers  
then it's a hassle to boot them all up, make scripts that will execute them and link correctly.  
There must be an easy way... And yes there is - Fast Isolated Containers developed 
by Orchard

# Summary

So far we've learned that:
* Linking container is nothing more than passing many environment variables and hostname from one container to another. There really nothing magic underneath.
* While trying to link your custom-made containers, remember to declare as many environment variables with `ENV` command as 'linked' container will need. For instance - while linking to a database another container should be informed about database/schema name and some login credentials.
* Linking container is a no bidirectional relation - linking is ***not*** the same as being linked. We'll explain this in detail during next excercise 

***And the most important conclusion***
***When designing a Dockerfile for your custom app make sure that it contains enough pieces of information (set in environment variables) about its services (like login credentials) so that after passing them to another container in linking procedure it will be really able to contact it***

# Things to check

* projects that make it easy to create dynamic environment
