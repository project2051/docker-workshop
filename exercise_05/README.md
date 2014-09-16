## Przyklad real-life 

Imagine a situation, in which our job is to write some scripts, that will manipulate a ready-made, existing program, such as Jenkins. Hopefully, Jenkins provides RESTful API to perform some administrative tasks. Our situation can be even more complex -  we don't like to install any Jenkins on our computer to have a safe testbed. We don't event want to install Java as well. We might be running another distro than our production server.


Do akcji wkroczy kontener, korzystający z obrazu ubuntu, z  odpalonym procesem Jenkinsa. Po napisaniu skryptu po wszystkim elegancko posprzątamy, a na wypadek dalszych prac, z pomocą Dockerfile'a łatwo odtworzymy nasze środowisko.

Budujemy kontener:
```
docker build .
```
I uruchamiamy go:
```
docker run -it -p 8080:8080 <image_id>
```

Nasz jenkins dostępny jest pod adresem http://192.168.59.103:8080, jesteśmy gotowi do zabawy jego API.

@TODO
wyjasnic opcje -p, dlaczego entrypoint
tutaj wchodzi EXPOSE.

Pokazac jak to dziala na macu ten expose bo jednak czasem moze byc krzak

Pokazac jak latwo mozna przenosic kontenery  : >
