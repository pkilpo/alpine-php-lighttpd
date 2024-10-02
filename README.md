#alpine-php-lighttpd

Why another Alpine PHP repository?
- I tried several and some of them outdated, some of them did not work on arm64 (Raspberry Pi5)
- I run two Wordpress blogs and had to add necessary PHP modules
- Wanted as small as possible image to be used as a backend containers behind reverse proxy
- Wanted latest stable PHP and lighttpd instead Nginx and Apache

Why not fork then?
- Would have changed too much on base repositories
- See credits

  # If you want to test for php uncomment this, do not leave this file in production
  #echo "<?php echo phpinfo(); ?>" > /var/www/your site/htdocs/info.php

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
- m4rcu5nl/docker-lighttpd-alpine
- alastairhm/alpine-lighttpd-php
