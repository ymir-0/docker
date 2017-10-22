# Apache & PHP
FROM		ubuntu:latest
MAINTAINER	Adminrezo	"admin@adminrezo.fr"
ENV		DEBIAN_FRONTEND	noninteractive
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
#ADD apache.conf /etc/supervisor/conf.d/apache.conf
ADD html /var/www/html
#ADD apache2 /etc/apache2
#CMD source /etc/apache2/envvar
CMD exec /usr/sbin/apache2 -DFOREGROUND
