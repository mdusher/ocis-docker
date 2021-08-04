#!/bin/sh

log_entry() {
    echo "{\"level\":\"info\",\"service\":\"docker-entrypoint\",\"time\":\"$(date +"%Y-%m-%dT%H:%M:%SZ")\",\"message\":\"${@}\"}"
}

ocis server &

# Stop any services that have a OCIS_DISABLE_<service>=false environment variable set
for srv in $(ocis list | awk '{print $2}' | grep -v "EXTENSION" | grep -v -E '^$'); do
    uppersrv="$(log_entry ${srv} | tr [:lower:] [:upper:] | sed 's/-/_/g')"
    disablesrv="$(printenv | grep "OCIS_DISABLE_${uppersrv}" | cut -d"=" -f2)"
    if [ "${disablesrv}" = "true" ]; then
	log_entry "Service '${srv}' is disabled. Killing."
	ocis kill ${srv}
    fi
done

if [ "${OCIS_DISABLE_ACCOUNTS}" = "" ]; then
    log_entry "Waiting for accounts service"
    accounts_srv=1
    while [ ${accounts_srv} -ne 0 ]; do
        ocis list | awk '{print $2}' | grep -c -E '^accounts$' 2>&1 > /dev/null
        accounts_srv=$?
        sleep 1
    done

    # Set storage password
    if [ "${STORAGE_LDAP_BIND_PASSWORD}" != "" ]; then
        REVA_USER_UUID=$(ocis accounts list | grep " | Reva Inter " | egrep '[0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12}' -o)
        log_entry "Updating storage password for reva user UUID: $REVA_USER_UUID"
        ocis accounts update --password $STORAGE_LDAP_BIND_PASSWORD $REVA_USER_UUID
    fi

    # Remove IDP user
    if [ "${OCIS_DISABLE_IDP}" = "false" ]; then
        IDP_USER_UUID=$(ocis accounts list | grep "| Kopano IDP " | egrep '[0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12}' -o)
        log_entry "Removing IDP user UUID: $IDP_USER_UUID"
        ocis accounts remove $IDP_USER_UUID
    fi

    # Cleanup default accounts
    log_entry "Cleaning up default accounts"
    for user in $(ocis accounts list | grep example.org | grep -v 'storage@example.org' | awk '{print $2}'); do 
        ocis accounts remove "$user"
    done
fi

wait
