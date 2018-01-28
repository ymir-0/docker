# INFO : this script create a docker containers with all PirateBox services
# it is a fork of the one at : https://github.com/PirateBox-Dev/PirateBox-Docker.git
# TODO :
# - install droopy (file upload)
# - configure forum
# - interactive port settings (dockerfile & piratebox directory)
FROM ubuntu:latest
LABEL maintener="ymir mazieres.pierre@gmail.com"

# parameters
ARG BRANCH=development
ARG REPOSITORY=https://github.com/PirateBox-Dev/PirateBoxScripts_Webserver.git

# update
RUN apt-get update -y ; apt-get upgrade -y -q ; apt-get dist-upgrade -y -q ; apt-get -y -q autoclean ; apt-get -y -q autoremove

# install packages
# even if droopy is included in repo PirateBoxScripts_Webserver.git (bin/droopy), we install it to avoid upload issues
RUN apt-get install -y python2.7 lighttpd perl php php-cgi git make wget droopy

# get development version
RUN git clone $REPOSITORY && \
    cd PirateBoxScripts_Webserver && \
    git checkout origin/$BRANCH && \
    find . -type f -exec sed -i -e 's/piratebox.lan/localhost/g' {} \; && \
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

# copy script
COPY start_piratebox.sh /
RUN chmod +x /start_piratebox.sh

# cleanup
RUN apt-get remove --purge -y git make ; \
    apt-get autoclean -y ; apt-get autoremove -y ; \
    rm -Rf /piratebox ; \
    rm -rv PirateBoxScripts_Webserver piratebox-ws_*.tar.gz

# lighttpd port
EXPOSE 80
# droopy port
EXPOSE 8080

# share space
VOLUME ["/opt/piratebox/share"]

# start service
# the 'while true' command avoid container to stop (so simulate a daemon)
CMD [ "/start_piratebox.sh" ]
