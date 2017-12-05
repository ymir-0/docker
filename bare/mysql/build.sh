. configuration.sh
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
