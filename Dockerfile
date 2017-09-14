FROM lsiobase/alpine.nginx:3.6

MAINTAINER cosmin@mailbox.org

ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# install packages
RUN apk add --no-cache curl \
  imagemagick \
  lynx \
  php7-apcu \
  php7-cgi \
  php7-dom \
  php7-exif \
  php7-gd \
  php7-imagick \
  php7-mysqli \
  php7-mysqlnd \
  php7-pear \
  php7-xmlrpc \
  php7-xsl \
  re2c \
  unzip \
  wget

RUN mkdir -p /config/www/gallery
COPY /Piwigo /config/www/gallery

# Configuration
COPY /Piwigo/include/config_default.inc.php /config/www/gallery/local/config/config.inc.php
COPY /nginx-default /defaults/default
COPY /database.inc.php /config/www/gallery/local/config
#COPY /php.ini /etc/php7/php.ini

RUN chown -R abc:abc /config

EXPOSE 80

VOLUME /config
