## Dockerfile

To store the container config in a wiser way and get closer to 'Infrastructure-as-a-Code' concept, we use Dockerfiles - text files with set of commands that strictly describe, how the container should be built.

In this folder you will find an example Dockerfile. Have a quick skim at it, and try to guess what it will create, before we will dive into its  syntax. Let's try to build out container:
```
docker build .
```
And run it:
```
docker run -i -t <container_id>
```

### What are the pros of Dockerfile?
* It's a CODE - Can be versioned, reviewed, easily distributed (imagine a VM image now)
* Easy to read, write - maintain
* Can be added to project repository and become part of automated test run
