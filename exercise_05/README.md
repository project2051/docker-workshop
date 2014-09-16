## Real-Life Example

Imagine a situation, in which our job is to write some scripts, that will manipulate a ready-made, existing program, such as Jenkins. Hopefully, Jenkins provides RESTful API to perform some administrative tasks. Our situation can be even more complex -  we don't like to install any Jenkins on our computer to have a safe testbed. We don't event want to install Java as well. We might be running another distro than our production server.

Let's bring to the action container, which, using Ubuntu image, will fire up the Jenkins instance. After our work with its API we will easily cleanup our environment, and in case of further work - with a Dockerfile our test environment will be easy to recreate.

Let's build and run our container
```
docker build .
```
I uruchamiamy go:
```
docker run -it -p 8080:8080 <image_id>    # -p switch needed with boot2docker
```

And voila! Our Jenkins API is ready for the first requests at either http://<boot2docker_host>:8080 or at localhost:8080 (linux).

@TODO
wyjasnic opcje -p, dlaczego entrypoint
tutaj wchodzi EXPOSE.

Pokazac jak to dziala na macu ten expose bo jednak czasem moze byc krzak

Pokazac jak latwo mozna przenosic kontenery  : >
