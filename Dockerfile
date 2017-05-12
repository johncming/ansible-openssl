FROM ubuntu:xenial
MAINTAINER johncming@yahoo.com

RUN apt-get update && apt-get install -y openssl

WORKDIR /root

COPY gen_key_cert.sh /usr/bin/
COPY clean_key_cert.sh /usr/bin/

RUN chmod +x /usr/bin/gen_key_cert.sh /usr/bin/clean_key_cert.sh

ENV CA_KEY=ca-key.pem CA_CERT=ca.pem
ENV CA_SUBJ="/C=CN/ST=Beijing/L=Haidian/O=JC/OU=JC/CN=docker.vagrant.test"

ENV SERVER_KEY=server-key.pem SERVER_CSR=server.csr
ENV SERVER_SUBJ="/CN=docker.vagrant.test""
ENV SERVER_CERT=server-cert.pem

COPY extfile.cnf /root
