IMAGE_CONTAINER_NAME="apache_php_perso"
HOST_SCRIPT_ABSOLUTE_PATH=`dirname $( readlink -f "$0" )` # absolute path is mandatory for volumes binding between host and container
docker build -t ${IMAGE_CONTAINER_NAME} .
# some files are not provided because they can :
# - depends of your server configuration
# - contains confidential data
# you can get them from another instance
docker run \
    -d \
    --name ${IMAGE_CONTAINER_NAME} \
    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/html:/var/www/html \ # not provided 
    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/apache2_conf:/etc/apache2 \ # not provided
    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/apache2_log:/var/log/apache2 \
    -p 80:80 ${IMAGE_CONTAINER_NAME} \
    /bin/sh -c "service apache2 start ; tail -f /dev/null"
