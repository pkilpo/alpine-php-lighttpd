#alpine-php-lighttpd

NOTE:
- Still in test phase!

Why another Alpine PHP repository?
- I tried several and some of them outdated, some of them did not work on arm64 (Raspberry Pi5)
- I run two Wordpress blogs and had to add necessary PHP modules
- Wanted as small as possible image to be used as a backend containers behind reverse proxy
- Wanted latest stable PHP and lighttpd instead Nginx and Apache

Why not fork then?
- Would have changed too much on base repositories
- See credits

Uses docker volumes for access log and site www

If you want to test for php run this in your docker volume:
Inside running container:
```bash
  echo "<?php echo phpinfo(); ?>" > /var/www/<your_site>/htdocs/info.php
```
In host machine:
```bash
  sudo echo "<?php echo phpinfo(); ?>" > /var/lib/docker/volumes/<your_volume>/_data
```
Lighttpd and PHP running on latest Alpine Docker image.

Build using;

```bash
docker build -t alpine-php-lighttpd .
```

Run from Docker Hub using;

```bash
docker run --name "my-php-lighttpd" --rm -p 8080:80 -v $(pwd):/var/www pkilpo/alpine-php-lighttpd
```

Works for static & PHP web content.

Credits:

Thank you for your work which helped me a lot in this project:
- https://wiki.alpinelinux.org/wiki/Production_LAMP_system:_Lighttpd_%2B_PHP_%2B_MySQL
- m4rcu5nl/docker-lighttpd-alpine
- alastairhm/alpine-lighttpd-php
