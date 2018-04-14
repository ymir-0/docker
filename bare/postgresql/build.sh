. configuration.sh
# ask user for settings
echo -n "postgres password : " && read POSTGRES_PASSWORD
echo -n "user login : " && read USER_LOGIN
echo -n "user password : " && read USER_PASSWORD
# apply user settings to users script
cp users.sql users.sql.pattern
sed -i s/"{POSTGRES_PASSWORD}"/${POSTGRES_PASSWORD}/g users.sql
sed -i s/"{USER_LOGIN}"/${USER_LOGIN}/g users.sql
sed -i s/"{USER_PASSWORD}"/${USER_PASSWORD}/g users.sql
# allow to edit shared volumes
#sudo chown -R ${USER} {log,data}
# create image
docker build -t ${IMAGE} .
# restore users script
mv users.sql.pattern users.sql
