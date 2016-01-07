#!/bin/bash

if [ -z "$PS_VERSION" ]; then
  echo "Prestashop version not found. Please set up OC_VERSION variable properly."
  exit 1
fi

curl -s -o /tmp/temp "https://github.com/opencart/opencart/archive/$OC_VERSION.zip"
unzip -q /tmp/temp -d /tmp
cp -rf /tmp/prestashop/* /var/www/html
rm -rf /tmp/*
chown -R www-data:www-data /var/www

if [ -n "$PLUGIN_NAME" ]; then
  chmod -Rf 777 /var/www/html/modules/$PLUGIN_NAME
fi

if [ -n "$1" ]; then
	exec $1
elseif
	exec /bin/true
fi
