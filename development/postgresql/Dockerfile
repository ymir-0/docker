FROM ymirfrostgiant/bare_postgresql
LABEL maintener="ymir mazieres.pierre@gmail.com"
# reimport configuration
COPY pg_hba.conf /
COPY postgresql.conf /
RUN cp /pg_hba.conf /etc/postgresql/**/main/postgresql.conf; \
    cp /pg_hba.conf /etc/postgresql/**/main/pg_hba.conf; \
    service postgresql restart; \
    rm -f /postgresql.conf /pg_hba.conf
# set directory permission
RUN chmod 700 /var/lib/postgresql/9.5/main
