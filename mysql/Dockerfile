FROM ubuntu:latest
LABEL maintener="ymir mazieres.pierre@gmail.com"
# update
RUN (apt-get update -y && apt-get upgrade -y -q && apt-get dist-upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove)
# installation
RUN apt-get install -y debconf-utils \
    && echo mysql-server-5.5 mysql-server/root_password password {ROOT_PASSWORD} | debconf-set-selections \
    && echo mysql-server-5.5 mysql-server/root_password_again password {ROOT_PASSWORD} | debconf-set-selections \
    && apt-get install -y mysql-server -o pkg::Options::="--force-confdef" -o pkg::Options::="--force-confold" --fix-missing
# configuration
RUN sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf \
    && service mysql start \
    && mysql -u root -p{ROOT_PASSWORD} --execute "GRANT ALL PRIVILEGES ON *.* TO '{USER_LOGIN}'@'%' IDENTIFIED BY '{USER_PASSWORD}' with GRANT OPTION; FLUSH PRIVILEGES;"
# export port
EXPOSE 3306
# the 'tail' command avoid container to stop (so simulate a daemon)
CMD exec /bin/bash -c "service mysql start ; tail -f /dev/null"
