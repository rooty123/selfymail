#!bin/bash

DATA_DIR=~/.selfymail
if [ ! -e $DATA_DIR ]; then
    mkdir $DATA_DIR
    mkdir $DATA_DIR/tls
    cp config/maddy.conf $DATA_DIR/
fi
if [ ! -e $DATA_DIR/tls/privkey.pem ]; then
    openssl genrsa -out $DATA_DIR/tls/privkey.pem 2048
    openssl req -new -x509 -key $DATA_DIR/tls/privkey.pem -out $DATA_DIR/tls/fullchain.pem -days 3650
fi

docker-compose up -d