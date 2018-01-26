# this script is a fork of the one at : https://github.com/PirateBox-Dev/PirateBox-Docker.git
FROM ubuntu:latest
LABEL maintener="ymir mazieres.pierre@gmail.com"


ARG BRANCH=development
ARG REPOSITORY=https://github.com/PirateBox-Dev/PirateBoxScripts_Webserver.git

# update
RUN apt-get update -y ; apt-get upgrade -y -q ; apt-get dist-upgrade -y -q ; apt-get -y -q autoclean ; apt-get -y -q autoremove

# install packages
RUN apt-get install -y python2.7 lighttpd perl php php-cgi git make wget # openrc

# Get development version
RUN git clone $REPOSITORY && \
    cd PirateBoxScripts_Webserver && \
    git checkout origin/$BRANCH && \
    make package

# Deploy & Adjust config
# Also remove redirect with hostname included. That won't work.
RUN mkdir -p /opt && \
    cp PirateBoxScripts_Webserver/piratebox-ws*.tar.gz . &&\
    tarfile=$( ls -1 piratebox-ws*.tar.gz ) &&\
    tar xzf "${tarfile}"  && \
    cp -rv piratebox/piratebox /opt && \
    sed -i -e 's/^DO_IFCONFIG="yes"/DO_IFCONFIG="no"/' \
           -e 's/^USE_APN="yes"/USE_APN="no"/' \
           -e 's/^USE_DNSMASQ="yes"/USE_DNSMASQ="no"/' \
           /opt/piratebox/conf/piratebox.conf  && \
    sed -i -e 's/^FIREWALL_FETCH_DNS="yes"/FIREWALL_FETCH_DNS="no"/' \
          /opt/piratebox/conf/firewall.conf && \
    sed -i -e 's|http://piratebox.lan||' /opt/piratebox/www/index.html

# Do PirateBox init
RUN /opt/piratebox/bin/install_piratebox.sh part2 ; \
    /opt/piratebox/bin/install_piratebox.sh imageboard

COPY start_piratebox.sh /
RUN chmod +x /start_piratebox.sh

## Cleanup
RUN apt-get remove --purge -y git make ; \
    apt-get autoclean -y ; apt-get autoremove -y ; \
    rm -rv PirateBoxScripts_Webserver piratebox-ws_1.2.0.tar.gz

# Lighttpd Port
EXPOSE 80
# Droopy Port  (soon absolete)
EXPOSE 8080

#Share space
VOLUME ["/opt/piratebox/share"]


# start service
# the 'tail' command avoid container to stop (so simulate a daemon)
#CMD exec /bin/bash -c "tail -f /dev/null"
CMD [ "/start_piratebox.sh" ]
