. configuration.sh
HOST_SCRIPT_ABSOLUTE_PATH=`dirname $( readlink -f "$0" )` # absolute path is mandatory for volumes binding between host and container
# ask user for settings
echo -n "root password : " && read ROOT_PASSWORD
echo -n "user login : " && read USER_LOGIN
echo -n "user password : " && read USER_PASSWORD
# apply user settings to Dockerfile
cp Dockerfile Dockerfile.pattern
sed -i s/"{ROOT_PASSWORD}"/${ROOT_PASSWORD}/g Dockerfile
sed -i s/"{USER_LOGIN}"/${USER_LOGIN}/g Dockerfile
sed -i s/"{USER_PASSWORD}"/${USER_PASSWORD}/g Dockerfile
# create image
docker build -t ${IMAGE} .
# restore Dockerfile
mv Dockerfile.pattern Dockerfile
# sample files can be found in archive : sample.tar.gz
# they contains folders :
# - apache2_conf : default apache configuration
# - html : default index and test site
# apache2_log : log file ; will be created if not existing
docker create \
    --name ${CONTAINER} \
    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/configuration:/etc/mysql \
    -p 3306:3306 \
    ${IMAGE}
#    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/html:/var/www/html \
#    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/apache2_conf:/etc/apache2 \
#    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/apache2_log:/var/log/apache2 \
