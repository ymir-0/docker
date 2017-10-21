# Apache & PHP
FROM     debian:wheezy
MAINTAINER Adminrezo "admin@adminrezo.fr"
ENV DEBIAN_FRONTEND noninteractive
# update
RUN (apt-get update && apt-get upgrade -y -q && apt-get dist-upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove)
# installation
RUN apt-get install -y -q apache2 libapache2-mod-php5 php5 supervisor
# Config de Apache
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
EXPOSE 80
# Demarrage des services
RUN mkdir -p /var/log/supervisor
ADD apache.conf /etc/supervisor/conf.d/apache.conf
CMD source /etc/apache2/envvars && exec /usr/sbin/apache2 -DFOREGROUND
