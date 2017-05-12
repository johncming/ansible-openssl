#!/bin/sh


# ca key
openssl genrsa -out $CA_KEY 4096

# ca cert
openssl req -subj $CA_SUBJ \
        -x509 -days 365 \
        -new -key $CA_KEY -sha256 -out $CA_CERT

# server key
openssl genrsa -out $SERVER_KEY 4096

# server csr
openssl req -subj $SERVER_SUBJ \
        -new -key $SERVER_KEY -sha256 -out $SERVER_CSR

# server cert
openssl x509 -req \
        -days 365 -sha256 \
        -in $SERVER_CSR -CA $CA_CERT -CAkey $CA_KEY \
        -CAcreateserial -out $SERVER_CERT -extfile /root/extfile.cnf

# client key
openssl genrsa -out $CLIENT_KEY 4096
