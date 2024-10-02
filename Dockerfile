FROM alpine:latest
ARG SITE_NAME=localhost
RUN apk --update add \
    php83-fpm php83-json php83-zlib php83-xml php83-xmlwriter php83-simplexml php83-pdo php83-phar php83-openssl \
    php83-pdo_mysql php83-mysqli php83-session \
    php83-gd php83-iconv php83-gmp php83-zip \
    php83-curl php83-opcache php83-ctype php83-apcu php83-pecl-imagick \
    php83-intl php83-bcmath php83-dom php83-mbstring php83-xmlreader php83-exif php83-fileinfo \
    lighttpd \
    fcgi && \
    rm -rf /var/cache/apk/*

ADD run.sh /usr/local/bin
ADD entrypoint.sh /usr/local/bin
RUN chmod u+x /usr/local/bin/run.sh && /usr/local/bin/run.sh ${SITE_NAME}
SHELL ["/bin/sh", "-c"]

EXPOSE 80
VOLUME /var/www
VOLUME /var/log/lighttpd

#Make postinstall and start apps php-fpm and lighttpd
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]


