IMAGE_NAME="perso/apache_php"
CONTAINER_NAME="perso_apache_php"
HOST_SCRIPT_ABSOLUTE_PATH=`dirname $( readlink -f "$0" )` # absolute path is mandatory for volumes binding between host and container
docker build -t ${IMAGE_NAME} .
# shared volumes are not provided because they can :
# - depends of your server configuration
# - contains confidential data
# you can get them from another instance
docker run \
    -d \
    --name ${CONTAINER_NAME} \
    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/html:/var/www/html \
    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/apache2_conf:/etc/apache2 \
    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/apache2_log:/var/log/apache2 \
    -p 80:80 ${IMAGE_NAME}
