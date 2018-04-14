. configuration.sh
HOST_SCRIPT_ABSOLUTE_PATH=`dirname $( readlink -f "$0" )` # absolute path is mandatory for volumes binding between host and container
# sample files can be found in archive : sample.tar.gz
# they contains folders :
# - configuration : default configuration
# - data : default databases
# log : will be created if not existing
docker create \
    --name ${CONTAINER} \
    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/configuration:/etc/postgresql \
    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/data:/var/lib/postgresql \
    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/log:/var/log/postgresql \
    -p 5432:5432 \
    ${IMAGE}
# set fine container directory rights
docker start ${CONTAINER}
docker exec -it ${CONTAINER} /bin/bash -c "chown -R postgres:postgres /etc/postgresql ; chown -R postgres:adm /var/log/postgresql ; chown -R postgres:postgres /var/lib/postgresql"
docker stop ${CONTAINER}
