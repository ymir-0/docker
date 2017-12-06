FROM ubuntu:latest
LABEL maintener="ymir mazieres.pierre@gmail.com"
# update
RUN apt-get update -y ; apt-get upgrade -y -q ; apt-get dist-upgrade -y -q ; apt-get -y -q autoclean ; apt-get -y -q autoremove
# install
RUN apt-get install -y python3 python3-pip \
    ; pip3 install --upgrade pip
# configure
RUN mkdir -p /root/.config/pip
# share volumes
ADD configuration /root/.config/pip
# install dummy
#RUN pip3 install helloworldpython3
# start service
# issue with hosts :
# - docker do not allow host edited on build : https://stackoverflow.com/questions/38302867/how-to-update-etc-hosts-file-in-docker-image-during-docker-build
#  - my docker version do not manage the "--add-host" build option : https://docs.docker.com/edge/engine/reference/commandline/build/
# so i finally set host in CMD step
# the 'tail' command avoid container to stop (so simulate a daemon)
CMD echo "91.121.9.53 yggdrasil yggdrasil.ip-91-121-eu ns37958.ip-91-121-eu" >> /etc/hosts \
    ; pip3 install hyPi helloworldpython3 \
    ; exec /bin/bash -c "tail -f /dev/null"
