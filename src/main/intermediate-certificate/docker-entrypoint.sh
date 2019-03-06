#!/bin/sh 

INTERMEDIATE_SUBJECT=${INTERMEDIATE_SUBJECT:-"/C=SE/ST=Vastra Gotaland/L=Gothenburg/O=MyTest/CN=intermediate.test/"}
export INTERMEDIATE_SUBJECT
ROOT_KEY_PASSWORD=${ROOT_KEY_PASSWORD:-"Abcd1234"}
export ROOT_KEY_PASSWORD
INTERMEDIATE_KEY_PASSWORD=${INTERMEDIATE_KEY_PASSWORD:-"Abcd1234"}
export INTERMEDIATE_KEY_PASSWORD
INTERMEDIATE_CERT_EXPIRATION_DAYS=${INTERMEDIATE_CERT_EXPIRATION_DAYS:-"1"}
export INTERMEDIATE_CERT_EXPIRATION_DAYS
CRL_EXPIRATION_DAYS=${CRL_EXPIRATION_DAYS:-"1"}
export CRL_EXPIRATION_DAYS
INTERMEDIATE_KEY_PERMISSIONS=${INTERMEDIATE_KEY_PERMISSIONS:-"400"}
export INTERMEDIATE_KEY_PERMISSIONS

/usr/local/bin/confd -onetime -backend env
if /ssl/create.certificates.sh; then
  echo "certificate created"
fi

