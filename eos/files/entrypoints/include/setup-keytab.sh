#!/bin/sh

# check eos keytab exists, otherwise exit
if [ ! -s /etc/eos.keytab ]; then
  if [ -d /keytabs ]; then
    cp /keytabs/eos.keytab /etc/eos.keytab
    if [ -e /keytabs/eos.client.keytab ]; then
      cp /keytabs/eos.client.keytab /etc/eos.client.keytab
    else
      cp /keytabs/eos.keytab /etc/eos.client.keytab
    fi
  else
    exit 1
  fi
else
  cp /etc/eos.keytab /etc/eos.client.keytab
fi

if [ -f /etc/eos.keytab ]; then
  chown daemon:daemon /etc/eos.keytab
  chmod 400 /etc/eos.keytab
fi

if [ -f /etc/eos.client.keytab ]; then
  chown daemon:daemon /etc/eos.client.keytab
  chmod 400 /etc/eos.client.keytab
fi