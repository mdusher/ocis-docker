# oCIS Docker Image

Docker image based on the ocis_keycloak deployment.

Most documentation available at https://owncloud.dev/ocis/deployment/ocis_keycloak/ will be relevant.

# TODO AND KNOWN PROBLEMS

* Cannot use 'mail' as username as groups API (`/ocs/v1.php/cloud/users/einstein%40example.org/groups`) does not allow `%40`, but works if manually changed to `@`
* Cannot logout as the oidc plugin for SimpleSAML does not provide a `end_session_endpoint`

# Environment Variables

* OCIS_DISABLE_<EXTENSIONNAME> - Disable an extension by setting this to true. `<EXTENSIONNAME>` can be replaced with the name of any extension, `-` must be replaced with `_`. (eg. to disable `storage-home`, set `OCIS_DISABLE_STORAGE_HOME=true`).

# docker-compose

With the default docker-compose, ensure you add entries to your host file:

```
ocis.owncloud.test 127.0.0.1
traefik.owncloud.test 127.0.0.1
```

Then, you can just run `docker-compose up -d` and visit https://ocis.owncloud.test/ and accept the certificate warning.