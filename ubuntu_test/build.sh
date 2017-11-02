. configuration.sh
HOST_SCRIPT_ABSOLUTE_PATH=`dirname $( readlink -f "$0" )` # absolute path is mandatory for volumes binding between host and container
mkdir shared
docker build -t ${IMAGE} .
docker create \
    --name ${CONTAINER} \
    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/shared:/home/shared \
    ${IMAGE}
