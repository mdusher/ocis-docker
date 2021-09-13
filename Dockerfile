FROM owncloud/ocis:1.11.0

ADD files/ocis/* /

ENTRYPOINT [ "/docker-entrypoint.sh" ]
