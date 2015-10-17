

What is it?
===========

[Cuberite](http://cuberite.org/) on [Docker](http://www.docker.com/).


Instructions
============

    git clone https://github.com/mparienti/cuberite-on-docker.git
    cd cuberite-on-docker/
    docker build -t cuberite .
    cd /where/you/want/to/store/your/data
    mkdir ./var ./world
    docker run -d -p 127.0.0.1:8080:8080 -p 25565:25565 -v `pwd`/var:/Server/var -v `pwd`/world:/Server/world  -t -i cuberite /Server/Cuberite -d


Todo
====
* Configure supervisor: `docker run` should automatically launch Cuberite.
* More detailed explanations about the `docker` commands and how to keep safe the data in `var` and `world` directories.
