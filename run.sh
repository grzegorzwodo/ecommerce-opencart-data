#!/bin/bash

if [ -z "$OC_VERSION" ]; then
  echo "Opencart version not found. Please set up OC_VERSION variable properly."
  exit 1
fi

wget   "https://github.com/opencart/opencart/archive/$OC_VERSION.zip" -P /tmp/
echo "unziping...."
unzip -q /tmp/$OC_VERSION.zip -d /tmp
cp -rf /tmp/opencart-$OC_VERSION/* /var/www/html
rm -rf /tmp/*
chown -R www-data:www-data /var/www
cp /var/www/html/upload/config-dist.php /var/www/html/upload/config.php
cp /var/www/html/upload/admin/config-dist.php /var/www/html/upload/admin/config.php

chown www-data /var/www/html/upload/config.php
chgrp www-data /var/www/html/upload/config.php

chown www-data /var/www/html/upload/admin/config.php
chgrp www-data /var/www/html/upload/admin/config.php

#if [ -n "$PLUGIN_NAME" ]; then
#  chmod -Rf 777 /var/www/html/modules/$PLUGIN_NAME
#fi

#copy plugin files
cp /var/www/html/plugin/seqr/admin/controller/payment/seqr.php /var/www/html/upload/admin/controller/payment/seqr.php

if [ -n "$1" ]; then
	exec $1
elseif
	exec /bin/true
fi
