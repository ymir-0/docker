FROM ubuntu:latest
LABEL maintener="ymir mazieres.pierre@gmail.com"
# update
RUN (apt-get update -y && apt-get upgrade -y -q && apt-get dist-upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove)
# install
RUN apt-get install -y debconf-utils \
    && echo mysql-server mysql-server/root_password password geantdegivre | debconf-set-selections \
    && echo mysql-server mysql-server/root_password_again password geantdegivre | debconf-set-selections \
    && apt-get install -y mysql-server -o pkg::Options::="--force-confdef" -o pkg::Options::="--force-confold" --fix-missing
# configure
RUN sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf \
    && service mysql start \
    && mysql -u root -pgeantdegivre --execute "GRANT ALL PRIVILEGES ON *.* TO 'ymir'@'%' IDENTIFIED BY 'geantdegivre' with GRANT OPTION; FLUSH PRIVILEGES;"
# share volumes
ADD configuration /etc/mysql
ADD data /var/lib/mysql
VOLUME /var/log/mysql
# export port
EXPOSE 3306
# the 'tail' command avoid container to stop (so simulate a daemon)
CMD exec /bin/bash -c "service mysql start ; tail -f /dev/null"
