#!/bin/bash

DATA_DIR=~/.selfymail
if [ ! -e $DATA_DIR ]; then
    mkdir $DATA_DIR
    mkdir $DATA_DIR/tls
    cp config/maddy.conf $DATA_DIR/
fi
if [ ! -e $DATA_DIR/tls/privkey.pem ]; then
    openssl genrsa -out $DATA_DIR/tls/privkey.pem 2048
    openssl req -new -x509 -key $DATA_DIR/tls/privkey.pem -out $DATA_DIR/tls/fullchain.pem -days 3650 -subj "/C=US/ST=California/L=San Francisco/O=My Org/CN=mydomain.com"
fi

if [ ! -e wg/wg0.conf ]; then
    echo "Please save wg0.conf wireguard config to wg/ folder to start selfymail. If you don't have please get it using telegram bot: https://t.me/selfymailbot"
    exit 1
fi 

if [ ! -e .env ]; then
read -p "Specify domain name: " domain
echo "DOMAIN=$domain" > .env

read -p "Do you want to set SMTP settings now? (y/n): " smtp_auth

if [ "$smtp_auth" == "y" ]; then
  read -p "Specify SMTP host: " smtp_host
  echo "OUTBOUND_SMTP_HOST=$smtp_host" >> .env

  # Ask user for SMTP port and save it to .env file
  read -p "Specify SMTP port: " smtp_port
  echo "OUTBOUND_SMTP_PORT=$smtp_port" >> .env  

  # Ask user for SMTP login and save it to .env file
  read -p "Specify SMTP login: " smtp_login
  echo "OUTBOUND_SMTP_LOGIN=$smtp_login" >> .env

  # Ask user for SMTP password and save it to .env file
  read -p "Specify SMTP password: " smtp_password
  echo "OUTBOUND_SMTP_PASSWORD=$smtp_password" >> .env
else
  # Set SMTP login and password to "not_defined" in .env file
  echo "OUTBOUND_SMTP_LOGIN=not_defined" >> .env
  echo "OUTBOUND_SMTP_PASSWORD=not_defined" >> .env
  echo "OUTBOUND_SMTP_HOST=not-defined" >> .env
  echo "OUTBOUND_SMTP_PORT=587" >> .env
fi
fi

docker-compose up -d