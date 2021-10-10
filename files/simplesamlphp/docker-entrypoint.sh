#!/bin/sh

mkdir -p /mnt/data /mnt/logs
chown -R apache:apache /mnt/
ln -sf /mnt/simplesamlphp/www /usr/local/apache2/htdocs/simplesaml
ln -sf /usr/local/apache2/htdocs/index.php /mnt/simplesaml/www/test_login.php

exec httpd -D FOREGROUND "$@"
