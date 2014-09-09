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
$docker ps -l
CONTAINER ID        IMAGE               COMMAND                         CREATED             STATUS                       PORTS               NAMES
fc9dd63a5cd8        ubuntu:14.04        apt-get -y install htop           7 days ago          Exited (127) 2 seconds ago                       condescending_engelbart

$ docker commit fc9d learn/withhtop
936981cf596412dcb781653a2a83b27416e9ebaa16d68ed3d2b2f0a7e591a6db
```
