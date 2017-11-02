FROM ubuntu:latest
LABEL maintener="ymir mazieres.pierre@gmail.com"
# update
RUN (apt-get update -y && apt-get upgrade -y -q && apt-get dist-upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove)
# share volumes
ADD shared /home/shared
# start service
# the 'tail' command avoid container to stop (so simulate a daemon)
CMD exec /bin/bash -c "tail -f /dev/null"
