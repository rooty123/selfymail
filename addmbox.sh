#!/bin/bash

if [ -n "$1" ]; then
  echo "Adding mail box $1"
else
  echo "Please provide mailbox@domain.com as argument"
  exit 1
fi

docker-compose stop
docker run --rm -it -v ~/.selfymail:/data foxcpp/maddy:0.6.3 creds create $1                                                                                                                   
docker run --rm -it -v ~/.selfymail:/data foxcpp/maddy:0.6.3 imap-acct create $1
docker-compose up -d