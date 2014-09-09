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

Spróbujmy wyjść z kontenera. Tak naprawdę wyjście jest równoznaczne z zakończeniem procesu powłoki, który jest podstawą naszego kontenera.


@TODO

przy okazji opowiedziec o commitowaniu

i zacommitowac
