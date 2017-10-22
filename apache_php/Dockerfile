# Apache & PHP
FROM       ubuntu:latest
MAINTAINER ymir          "mazieres.pierre@gmail.com"
# update
RUN (apt-get update -y && apt-get upgrade -y -q && apt-get dist-upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove)
# installation
RUN apt-get install -y -q apache2 libapache2-mod-php php supervisor
# apache configuration
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
EXPOSE 80
# share volumes
ADD html /var/www/html
ADD apache2_conf /etc/apache2
# start service
# the 'tail' command avoid container to stop (so simulate a daemon)
CMD exec /bin/bash -c "service apache2 start ; tail -f /dev/null"
