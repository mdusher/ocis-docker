#!/bin/sh

mkdir -p /mnt/data /mnt/logs
chown -R apache:apache /mnt/
ln -sf /mnt/simplesamlphp/www /usr/local/apache2/htdocs/simplesaml

exec httpd -D FOREGROUND "$@"
