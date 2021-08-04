# oCIS Docker Image

Docker image based on the ocis_keycloak deployment.

# Environment Variables

* OCIS_DISABLE_<EXTENSIONNAME> - Disable an extension by setting this to true. `<EXTENSIONNAME>` can be replaced with the name of any extension, `-` must be replaced with `_`. (eg. to disable `storage-home`, set `OCIS_DISABLE_STORAGE_HOME=true`).

