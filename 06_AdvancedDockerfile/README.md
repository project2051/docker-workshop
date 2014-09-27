## Dockerfile revisited

This is what we usually expect Dockerfile to look like. Many, many sequences of commands...

In `complex_app` directory you will find a really complex Dockerfile. It will launch all the application stack.

```
docker build -t advanced .
```
Run the container
```
docker run -it -v /var/lib/postgresql:$PWD/data advanced 
```

How does the volume work?

Volume is basically a 'shared' resource (directory) between your local workstation and a docker container. In case of PostgreSQL, all the postgres data & metadata will be stored locally on your workstations filesystem,so that it won't be ephemeral as it would by default be.

The `-v <container_path>:<workstation_path>` switch defines which directory from the container should be shared with certain directory in our workstation. 

Please **note**, that container will continue running, even if path are not correct! No directory will be shared between a container and your laptop, and the container will run just like the VOLUME didn't appear in Dockerfile.
