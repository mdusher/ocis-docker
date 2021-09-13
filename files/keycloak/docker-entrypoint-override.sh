#!/bin/bash
printenv

cert_dir="/opt/jboss/keycloak/gencerts"
if [ ! -f "${cert_dir}/keycloak.crt" ]; then
	openssl req -newkey rsa:3072 -new -x509 -days 3652 -nodes -subj "/C=AU/ST=VIC/L=Melbourne/O=ownCloud Infinite Scale Test/CN=${KEYCLOAK_DOMAIN}" -out "${cert_dir}/keycloak.crt" -keyout "${cert_dir}/keycloak.pem"
fi

cert_public_key="$(cat "${cert_dir}/keycloak.crt" | grep -v '^-----' | awk 'NF {sub(/\r/, ""); printf "%s",$0;}')"
cert_private_key="$(cat "${cert_dir}/keycloak.pem" | grep -v '^-----' | awk 'NF {sub(/\r/, ""); printf "%s",$0;}')"

# replace oCIS domain in keycloak realm import
cp /opt/jboss/keycloak/ocis-realm.dist.json /opt/jboss/keycloak/ocis-realm.json
sed -i "s/ocis.owncloud.test/${OCIS_DOMAIN}/g" /opt/jboss/keycloak/ocis-realm.json
sed -i "s/{{ generated_public_key }}/${cert_public_key}/g" /opt/jboss/keycloak/ocis-realm.json
sed -i "s/{{ generated_private_key }}/${cert_private_key}/g" /opt/jboss/keycloak/ocis-realm.json
# run original docker-entrypoint
/opt/jboss/tools/docker-entrypoint.sh
