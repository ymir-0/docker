. configuration.sh
HOST_SCRIPT_ABSOLUTE_PATH=`dirname $( readlink -f "$0" )` # absolute path is mandatory for volumes binding between host and container
docker build -t ${IMAGE} .
# sample files can be found in archive : sample.tar.gz
# they contains folders :
# - apache2_conf : default apache configuration
# - html : default index and test site
# apache2_log : log file ; will be created if not existing
docker create \
    --name ${CONTAINER} \
    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/html:/var/www/html \
    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/apache2_conf:/etc/apache2 \
    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/apache2_log:/var/log/apache2 \
    -p 80:80 \
    ${IMAGE}
