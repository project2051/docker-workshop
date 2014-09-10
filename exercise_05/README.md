## Przyklad real-life 

Wyobraźmy sobie sytuację, w której musimy oskryptować gotowy soft, np. Jenkinsa. Na nasze szczęście, Jenkins udostępnia restowe API. Nie chcemy jednak instalować ani Javy, ani Jenkinsa na swoim komputerze - w dodatku Jenkins ten będzie uruchomiony na linuksie Ubuntu - czyli systemie, którego także nie chcemy instalować.

Do akcji wkroczy kontener, korzystający z obrazu ubuntu, z  odpalonym procesem Jenkinsa. Po napisaniu skryptu po wszystkim elegancko posprzątamy, a na wypadek dalszych prac, z pomocą Dockerfile'a łatwo odtworzymy nasze środowisko.


@TODO

tutaj wchodzi EXPOSE.

Pokazac jak to dziala na macu ten expose bo jednak czasem moze byc krzak

Pokazac jak latwo mozna przenosic kontenery  : >
