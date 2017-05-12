FROM ubuntu:xenial
MAINTAINER johncming@yahoo.com

RUN apt-get update && apt-get install -y openssl
