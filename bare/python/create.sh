. configuration.sh
HOST_SCRIPT_ABSOLUTE_PATH=`dirname $( readlink -f "$0" )` # absolute path is mandatory for volumes binding between host and container
docker create \
    --name ${CONTAINER} \
    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/configuration:/root/.config/pip \
    ${IMAGE}
