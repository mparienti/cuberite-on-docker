# Cuberite

FROM debian:jessie
MAINTAINER Michaël Parienti <aleph-g+pub@parienti.net>


LABEL Description="This image is used to start the Cuberite Server" Version="0.1"

# Install base
RUN apt-get update && apt-get install -y \
    wget \
    supervisor

# Get and install Cuberite binary
RUN wget http://builds.cuberite.org/job/Cuberite%20Linux%20x64%20Master/lastSuccessfulBuild/artifact/Cuberite.tar.gz
RUN tar xzf Cuberite.tar.gz

# Prepare directories which should be volumed
RUN mkdir /Server/world
RUN mkdir /Server/var

WORKDIR /Server/var
RUN touch  Ranks.sqlite banlist.sqlite whitelist.sqlite MojangAPI.sqlite
WORKDIR /Server
RUN ln -s ./var/Ranks.sqlite . ;\
    ln -s ./var/banlist.sqlite . ;\
    ln -s ./var/whitelist.sqlite . ;\
    ln -s ./var/MojangAPI.sqlite . ;

EXPOSE 25565 8080

RUN echo "[WebAdmin]\nEnabled=1\nPort=8080\n\n[User:cubeadmin]\nPassword=cubepass\n" > webadmin.ini 

#CMD ["/Server/Cuberite"]
