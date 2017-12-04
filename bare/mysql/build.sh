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
# allow to edit shared volumes
sudo chown -R ${USER} {log,data}
# create image
docker build -t ${IMAGE} .
# restore Dockerfile
mv Dockerfile.pattern Dockerfile
# sample files can be found in archive : sample.tar.gz
# they contains folders :
# - configuration : default configuration
# - data : default databases
# log : will be created if not existing
docker create \
    --name ${CONTAINER} \
    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/configuration:/etc/mysql \
    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/data:/var/lib/mysql \
    -v ${HOST_SCRIPT_ABSOLUTE_PATH}/log:/var/log/mysql \
    -p 3306:3306 \
    ${IMAGE}
# set fine container directory rights
docker start ${CONTAINER}
docker exec -it ${CONTAINER} /bin/bash -c "chown -R mysql:adm /var/log/mysql && chown -R mysql:mysql /var/lib/mysql"
docker stop ${CONTAINER}
