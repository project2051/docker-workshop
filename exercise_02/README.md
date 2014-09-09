W tym ćwiczeniu powiemy o niemutowalności - podstawowej cesze kontenerów.

Uruchamiamy kontener
```
docker run -it ubuntu /bin/bash
```

Będąc naszym kontenerze zainstalujmy paczkę htop, żeby móc uruchomić ten program:
```
apt-get update        # koniecznie !
apt-get install htop
htop
```
Nawiasem mówiąc, warto zwrócić uwagę na ile kontener jest odizolowaną pulą procesów. Co widać w htopie? :smile:

Spróbujmy wyjść z kontenera. Tak naprawdę wyjście jest równoznaczne z zakończeniem procesu powłoki, który jest podstawą naszego kontenera. Ponowne uruchomienie kontenera z obrazu ubuntu i uruchomienie w nim htop-a wywoła błąd - brak tego programu.

Polecenie `docker ps -l` (l jak latest) wyświetli nam uruchomione kontenery, także te, które już się zakończyły. Aby uzyskać więcej opcji konkretnej komendy dockera, poprzedzamy ją parametrem 'help', np. `docker help ps`. 

Oczywiście sam bazowy obraz często nam nie wystarczy, dlatego po zainstalowaniu htopa na kontenerze, zacommitujmy zmiany:
```
$ docker ps -l

$ docker commit <ID 'ZMUTOWANEGO' KONTENERA> learn/withhtop
```
Polecenie `docker commit` wywołane z ID bazowego obrazu zwróci nam identyfikator nowopowstałego kontenera. Wywołując natomiast `docker inspect <ID>` uzyskamy zgrabny JSON ze szczegółami kontenera.
