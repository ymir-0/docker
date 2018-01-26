# INFO : this script create a docker containers with all PirateBox services
# TODO :
# - install droopy (file upload)
# - configure forum
# - change hard coded links to (ie "piratebox.lan:8080")
# - interactive port settingd
# this script is a fork of the one at : https://github.com/PirateBox-Dev/PirateBox-Docker.git
FROM ubuntu:latest
LABEL maintener="ymir mazieres.pierre@gmail.com"

# parameters
ARG BRANCH=development
ARG REPOSITORY=https://github.com/PirateBox-Dev/PirateBoxScripts_Webserver.git

# update
RUN apt-get update -y ; apt-get upgrade -y -q ; apt-get dist-upgrade -y -q ; apt-get -y -q autoclean ; apt-get -y -q autoremove

# install packages
RUN apt-get install -y python2.7 lighttpd perl php php-cgi git make wget

# get development version
RUN git clone $REPOSITORY && \
    cd PirateBoxScripts_Webserver && \
    git checkout origin/$BRANCH && \
    make package

# deploy & Adjust config
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

# do PirateBox init
RUN /opt/piratebox/bin/install_piratebox.sh part2 ; \
    /opt/piratebox/bin/install_piratebox.sh imageboard

COPY start_piratebox.sh /
RUN chmod +x /start_piratebox.sh

# cleanup
RUN apt-get remove --purge -y git make ; \
    apt-get autoclean -y ; apt-get autoremove -y ; \
    rm -rv PirateBoxScripts_Webserver piratebox-ws_1.2.0.tar.gz

# lighttpd port
EXPOSE 80
# droopy port
EXPOSE 8080

# share space
VOLUME ["/opt/piratebox/share"]


# start service
# the 'while true' command avoid container to stop (so simulate a daemon)
CMD [ "/start_piratebox.sh" ]
