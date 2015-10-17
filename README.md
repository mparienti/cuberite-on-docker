

Instructions
============


docker build -t cuberite .
cd /where/you/want/to/store/your/data/world
mkdir ./var ./world
docker run  -p 127.0.0.1:8080:8080 -p 25565:25565 -v ./var:/Server/var -v ./world:/Server/world  -t -i cuberite /bin/bash
./Cuberite


Todo
====
* Configure supervisor
* `docker run` should automatically launch Cuberite
