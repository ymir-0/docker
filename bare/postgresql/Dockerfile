FROM ubuntu:latest
LABEL maintener="ymir mazieres.pierre@gmail.com"
# update
RUN apt-get update -y ; apt-get upgrade -y -q ; apt-get dist-upgrade -y -q ; apt-get -y -q autoclean ; apt-get -y -q autoremove
# install
COPY pg_hba.conf /pg_hba.conf
COPY users.sql /
RUN apt-get install -y postgresql
RUN cp /pg_hba.conf /etc/postgresql/**/main/pg_hba.conf; \
   service postgresql restart; \
   su - postgres -c "psql -f /users.sql"; \
   rm -f /pg_hba.conf /users.sql
# share volumes
# export port
EXPOSE 5432
# the 'tail' command avoid container to stop (so simulate a daemon)
CMD exec /bin/bash -c "service postgresql start ; tail -f /dev/null"
