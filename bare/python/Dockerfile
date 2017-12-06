FROM ubuntu:latest
LABEL maintener="ymir mazieres.pierre@gmail.com"
# update
RUN apt-get update -y ; apt-get upgrade -y -q ; apt-get dist-upgrade -y -q ; apt-get -y -q autoclean ; apt-get -y -q autoremove
# install
RUN apt-get install -y python3 python3-pip \
    ; pip3 install --upgrade pip
# configure
RUN echo "91.121.9.53 yggdrasil yggdrasil.ip-91-121-eu ns37958.ip-91-121-eu" >> /etc/hosts \
    ; mkdir -p /root/.config/pip
# share volumes
ADD configuration /root/.config/pip
# install dummy
#RUN pip3 install helloworldpython3
# start service
# the 'tail' command avoid container to stop (so simulate a daemon)
CMD exec /bin/bash -c "tail -f /dev/null"
