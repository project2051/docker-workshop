## Przyklad real-life 

Wyobraźmy sobie sytuację, w której musimy oskryptować gotowy soft, np. Jenkinsa. Na nasze szczęście, Jenkins udostępnia restowe API. Nie chcemy jednak instalować ani Javy, ani Jenkinsa na swoim komputerze - w dodatku Jenkins ten będzie uruchomiony na linuksie Ubuntu - czyli systemie, którego także nie chcemy instalować.

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
