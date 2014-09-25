## Dockerfile revisited

This is what we usually expect Dockerfile to look like. Many, many sequences of commands...

In `complex_app` directory you will find a really complex Dockerfile. It will launch all the application stack.

```
docker build -t advanced .
```
Run the container
```
docker
```

How does the volume work?
Volume is basically a 'shared' resource between your local workstation and a docker container. In case of PostgreSQL, all the postgres data & metadata will be stored locally,so that it won't be ephemeral as it would by default be.
