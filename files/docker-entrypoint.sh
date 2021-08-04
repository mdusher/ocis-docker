#!/bin/sh

log_entry() {
    echo "{\"level\":\"info\",\"service\":\"docker-entrypoint\",\"time\":\"$(date +"%Y-%m-%dT%H:%M:%SZ")\",\"message\":\"${@}\"}"
}

# Get list of extensions from help text
ocis_extensions="$(ocis help | awk '{print $1}' | sed ':a;N;$!ba;s/\n/ /g' | sed 's/.*Extensions: \(.*\)Fullstack:.*/\1/g')"

# Generate list of extensions to use
enabled_ext=""
for ext in $ocis_extensions; do
    upper_ext="$(echo ${ext} | tr [:lower:] [:upper:] | sed 's/-/_/g')"
    disable_ext="$(printenv | grep "OCIS_DISABLE_${upper_ext}" | cut -d"=" -f2)"
    if [ "${disable_ext}" = "true" ]; then
        echo "Disabling '${ext}'"
    else
        echo "Enabling '${ext}'"
        enabled_ext="${enabled_ext} ${ext}"
    fi
done
enabled_ext="$(echo $enabled_ext | sed 's/ /, /g')"
log_entry "enabled extensions: $enabled_ext"

# Start server
ocis server --extensions="${enabled_ext}" &

if [ "${OCIS_DISABLE_ACCOUNTS}" != "true" ]; then
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
