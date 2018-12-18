FROM ubuntu:12.04
RUN apt-get update
RUN apt-get install -y build-essential
RUN mkdir /dirtycow
RUN groupadd -r dcow && useradd --no-log-init -r -g dcow dcow
COPY dirtyc0w.c /dirtycow-vdso/dirtyc0w.c
RUN chown -R dcow:dcow /dirtycow
RUN echo 'dcow:pass' | chpasswd
USER dcow
WORKDIR /dirtycow
RUN gcc -pthread dirtyc0w.c -o dirtyc0w
