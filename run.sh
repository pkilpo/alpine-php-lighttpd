#!/bin/sh
chmod ug+x /usr/local/bin/entrypoint.sh

# Process lighttpd.conf
sed -i -r 's#\#.*mod_alias.*,.*#    "mod_alias",#g' /etc/lighttpd/lighttpd.conf
sed -i -r 's#\#.*mod_rewrite.*,.*#    "mod_rewrite",#g' /etc/lighttpd/lighttpd.conf
sed -i -r 's#.*include "mod_cgi.conf".*#   include "mod_cgi.conf"#g' /etc/lighttpd/lighttpd.conf
sed -i -r 's#.*include "mod_fastcgi.conf".*#\#   include "mod_fastcgi.conf"#g' /etc/lighttpd/lighttpd.conf
sed -i -r 's#.*include "mod_fastcgi_fpm.conf".*#   include "mod_fastcgi_fpm.conf"#g' /etc/lighttpd/lighttpd.conf
sed -i -r 's#^.*var.basedir *=.*#var.basedir = "/var/www/'"$1"'"#g' /etc/lighttpd/lighttpd.conf
sed -e '/index-file.names/ s/^#*/#/' -i /etc/lighttpd/lighttpd.conf

# Process php-fpm.conf
sed -i -r 's|^pid =.*|pid = /run/php-fpm83/php83-fpm.pid|g' /etc/php*/php-fpm.conf

# Use socket for communicating with php-fpm
mkdir -p /var/run/php-fpm83/
cat > /etc/lighttpd/mod_fastcgi_fpm.conf << EOF
server.modules += ( "mod_fastcgi" )
index-file.names += ( "index.php" )
fastcgi.server = (
    ".php" => (
      "localhost" => (
        "socket"                => "/var/run/php-fpm83/php83-fpm.sock",
        "broken-scriptfilename" => "enable"
      ))
)
EOF

# Process php-fpm's www.conf
sed -i -r 's|^.*user =.*|user = lighttpd|g' /etc/php*/php-fpm.d/www.conf
sed -i -r 's|^.*group =.*|group = lighttpd|g' /etc/php*/php-fpm.d/www.conf
sed -i -r 's|^.*listen =.*|listen = /var/run/php-fpm83/php83-fpm.sock|g' /etc/php*/php-fpm.d/www.conf
sed -i -r 's|^.*listen.owner = .*|listen.owner = lighttpd|g' /etc/php*/php-fpm.d/www.conf
sed -i -r 's|^.*listen.group = .*|listen.group = lighttpd|g' /etc/php*/php-fpm.d/www.conf
sed -i -r 's|^.*listen.mode = .*|listen.mode = 0660|g' /etc/php*/php-fpm.d/www.conf
