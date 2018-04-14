. configuration.sh
HOST_SCRIPT_ABSOLUTE_PATH=`dirname $( readlink -f "$0" )` # absolute path is mandatory for volumes binding between host and container
# sample files can be found in archive : sample.tar.gz
# they contains folders :
# - configuration : default configuration
# - data : default databases
# log : will be created if not existing
docker create \
    --name ${CONTAINER} \
    -p 5432:5432 \
    -p 5433:5433 \
    ${IMAGE}
# set fine container directory rights
