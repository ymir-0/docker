. configuration.sh
HOST_SCRIPT_ABSOLUTE_PATH=`dirname $( readlink -f "$0" )` # absolute path is mandatory for volumes binding between host and container
# sample files can be found in archive : sample.tar.gz
# they contains folders :
# - configuration : default configuration
# - html : default index and test site
# log : will be created if not existing
docker create \
    --name ${CONTAINER} \
    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/html:/var/www/html \
    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/configuration:/etc/apache2 \
    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/log:/var/log/apache2 \
    -p 81:80 \
    ${IMAGE}
# 81:80 connection reset by peer
# 80:81 port is already allocated
