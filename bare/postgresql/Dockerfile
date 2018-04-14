FROM ubuntu:latest
LABEL maintener="ymir mazieres.pierre@gmail.com"
# update
RUN apt-get update -y ; apt-get upgrade -y -q ; apt-get dist-upgrade -y -q ; apt-get -y -q autoclean ; apt-get -y -q autoremove
# install
RUN apt-get install -y postgresql
COPY pg_hba.conf /pg_hba.conf
RUN cp /pg_hba.conf /etc/postgresql/**/main/pg_hba.conf; \
   rm -f /pg_hba.conf
COPY users.sql /
# share volumes
# export port
EXPOSE 5432
# the 'tail' command avoid container to stop (so simulate a daemon)
CMD exec /bin/bash -c "service postgresql start ; tail -f /dev/null"
