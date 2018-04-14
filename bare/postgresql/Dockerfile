FROM ubuntu:latest
LABEL maintener="ymir mazieres.pierre@gmail.com"
# update
RUN apt-get update -y ; apt-get upgrade -y -q ; apt-get dist-upgrade -y -q ; apt-get -y -q autoclean ; apt-get -y -q autoremove
# install
# share volumes
# export port
EXPOSE 5432
EXPOSE 5432
# the 'tail' command avoid container to stop (so simulate a daemon)
CMD exec /bin/bash -c "service mysql start ; tail -f /dev/null"
