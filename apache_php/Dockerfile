FROM ubuntu:latest
LABEL maintener="ymir mazieres.pierre@gmail.com"
# update
RUN (apt-get update -y && apt-get upgrade -y -q && apt-get dist-upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove)
# install
RUN apt-get install -y -q apache2 libapache2-mod-php php supervisor
# configure
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
# share volumes
ADD html /var/www/html
ADD configuration /etc/apache2
# export ports
EXPOSE 80
# start service
# the 'tail' command avoid container to stop (so simulate a daemon)
CMD exec /bin/bash -c "service apache2 start ; tail -f /dev/null"
