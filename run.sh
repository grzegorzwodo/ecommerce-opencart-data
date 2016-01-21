#!/bin/bash

if [ -z "$OC_VERSION" ]; then
  echo "Opencart version not found. Please set up OC_VERSION variable properly."
  exit 1
fi

wget "https://github.com/SeamlessDistribution/seqr-webshop-plugin/archive/develop.zip" -P /tmp/
unzip /tmp/develop.zip -d /tmp
mkdir /var/www/html/seqr/
cp -rf /tmp/seqr-webshop-plugin-develop/src/main/* /var/www/html/seqr/

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

if [ -n "$1" ]; then
	exec $1catalog
elseif
	exec /bin/true
fi
