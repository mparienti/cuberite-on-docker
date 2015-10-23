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

COPY ./files/webadmin.ini ./

COPY ./files/supervisord.conf /etc/supervisor/

EXPOSE 25565 8080

CMD ["/usr/bin/supervisord"]
