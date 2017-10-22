# Apache & PHP
FROM       ubuntu:latest
MAINTAINER ymir            "mazieres.pierre@gmail.com"
ENV        DEBIAN_FRONTEND noninteractive
# update
RUN (apt-get update -y && apt-get upgrade -y -q && apt-get dist-upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove)
# installation
RUN apt-get install -y -q apache2 libapache2-mod-php php supervisor
# Config de Apache
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
EXPOSE 80
# Demarrage des services
RUN mkdir -p /var/log/supervisor
ADD html /var/www/html
ADD apache2_conf /etc/apache2
#CMD exec /usr/sbin/apache2 -DFOREGROUND
