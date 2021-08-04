# oCIS Docker Image

Docker image based on the ocis_keycloak deployment. 

Most documentation available at https://owncloud.dev/ocis/deployment/ocis_keycloak/ will be relevant.

# Environment Variables

* OCIS_DISABLE_<EXTENSIONNAME> - Disable an extension by setting this to true. `<EXTENSIONNAME>` can be replaced with the name of any extension, `-` must be replaced with `_`. (eg. to disable `storage-home`, set `OCIS_DISABLE_STORAGE_HOME=true`).

# docker-compose

With the default docker-compose, ensure you add entries to your host file:

```
keycloak.owncloud.test 127.0.0.1
ocis.owncloud.test 127.0.0.1
traefik.owncloud.test 127.0.0.1
```

Then, you can just run `docker-compose up -d` and visit https://keycloak.owncloud.test/ and accept the certificate warning before visiting https://ocis.owncloud.test/ - otherwise, you may be presented with a blank page.