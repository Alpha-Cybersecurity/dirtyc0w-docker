FROM ubuntu:12.04

RUN apt-get update
RUN apt-get install -y build-essential

RUN mkdir /dirtycow
COPY dirtyc0w.c /dirtycow/dirtyc0w.c

RUN groupadd -r dcow && useradd --no-log-init -r -g dcow dcow
RUN echo 'dcow:pass' | chpasswd

RUN chown -R dcow:dcow /dirtycow

USER dcow

WORKDIR /dirtycow

RUN gcc -pthread dirtyc0w.c -o dirtyc0w
