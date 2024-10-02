#Alpine-lighttpd-php

  # If you want to test for php uncomment this, do not leave this file in production
  #echo "<?php echo phpinfo(); ?>" > /var/www/localhost/htdocs/info.php

[![](http://dockeri.co/image/alastairhm/alpine-lighttpd-php)](https://index.docker.io/u/alastairhm/alpine-lighttpd-php/)

[![Deploy Docker](https://github.com/alastairhm/alpine-lighttpd-php/actions/workflows/deploy.yml/badge.svg)](https://github.com/alastairhm/alpine-lighttpd-php/actions/workflows/deploy.yml)

Lighttpd and PHP running on an Alpine Docker image.

Build using;

```bash
docker build -t alpine-lighttpd-php .
```

Run from Docker Hub using;

```bash
docker run --name "my-lighttpd-php" --rm -p 8000:80 -v $(pwd):/var/www alastairhm/alpine-lighttpd-php
```

Or from GitHub packages using;

```bash
docker run --name "my-lighttpd-php" --rm -p 8000:80 -v $(pwd):/var/www ghcr.io/alastairhm/alpine-lighttpd-php
```

Works for static & PHP web content.

```text
          _    _ __  __ 
    /\   | |  | |  \/  | Email   : alastair@montgomery.me.uk
   /  \  | |__| | \  / | Web     : https://blog.0x32.co.uk/
  / /\ \ |  __  | |\/| | Twitter : @alastair_hm
 / ____ \| |  | | |  | |
/_/    \_\_|  |_|_|  |_| (c) 2021
```
