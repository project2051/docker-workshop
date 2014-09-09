## Zarządzanie obrazami

Użyty przez nas obraz 'ubuntu' to tylko przykład. Istnieje repozytorium z setkami gotowych kontenerów, z odpowiednimi dystrybucjami linuksa pod maską i preinstalowanymi pakietami. Bardzo łatwo je przeszukać poleceniem search:
```
docker search jenkins
```

Przykładowym obrazem z oryginalnego dockerowego tutoriala jest 'learn/tutorial'. Nazwa obrazu składa się z dwóch członów, jest ona postaci <maintainer>/<nazwa_obrazu> Zaciągnijmy ten obraz na nasz laptop:
```
docker pull learn/tutorial
```
Zobaczymy, gdzie to się ściągnęło @TODO.
Teraz możemy na tym obrazie wykonywać różne procesy, tak jak poprzednio:
```
docker run learn/tutorial echo "JOU!"
```
