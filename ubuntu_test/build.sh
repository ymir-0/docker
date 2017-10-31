. configuration.sh
HOST_SCRIPT_ABSOLUTE_PATH=`dirname $( readlink -f "$0" )` # absolute path is mandatory for volumes binding between host and container
docker build -t ${IMAGE} .
docker create \
    --name ${CONTAINER} \
    -p 80:80 \
    ${IMAGE}
