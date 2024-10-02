#!/bin/sh
TEST_FILE=/var/www/$SITE_NAME/htdocs/.placeholder
if [ ! -f $TEST_FILE ]
then
  echo -n "File $TEST_FILE does not exist. Initializing first..."
  mkdir -p /var/www/$SITE_NAME/htdocs /var/www/$SITE_NAME/cgi-bin
  chown -R lighttpd:lighttpd /var/www/$SITE_NAME
  touch /var/www/$SITE_NAME/htdocs/.placeholder
  echo -e "done"
else
  echo -e "Initialization is already done."
fi
echo -e "Starting services php fpm and lighttpd..."
php-fpm83
lighttpd -D -f /etc/lighttpd/lighttpd.conf



