## Startujemy

Pierwsza rzecz - dockerowe "Hello, World!"
```
$ sudo docker run -it ubuntu cat /etc/issue
```
Ew, jeżeli mamy OS X - uruchamiamy `boot2docker`:
```
$ boot2docker start
2014/09/10 00:13:44 Waiting for VM to be started...
..
2014/09/10 00:14:00 Started.
2014/09/10 00:14:00 To connect the Docker client to the Docker daemon, please set:
2014/09/10 00:14:00     export DOCKER_HOST=tcp://192.168.59.103:2375
$ export DOCKER_HOST=tcp://192.168.59.103:2375
$ docker run -it ubuntu cat /etc/issue
Ubuntu 14.04.1 LTS \n \l
```

CO SIE STAUO?!
```
$ docker run -it ubuntu /bin/bash
```
Teraz znajdujemy się 'w środku' kontenera.

Sama komenda `docker` posiada wiele poleceń, np. `docker version`, wielu z nich przyjrzymy się jeszcze później. 

Użyty przez nas obraz 'ubuntu' to tylko przykład. Istnieje repozytorium z setkami gotowych kontenerów, z odpowiednimi dystrybucjami linuksa pod maską i preinstalowanymi pakietami. Bardzo łatwo je przeszukać poleceniem search:
```
docker search jenkins
```


