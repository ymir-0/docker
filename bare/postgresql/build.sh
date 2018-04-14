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
# create image
# INFO : it is dangerous to change postgreSQL files rights, so we use sudo to read them
# INFO : we use sudo to read postgreSQL files :
#  - it is dangerous to change owner & rights
#  - we can read log without issue but need to be root to archive configuration & data
sudo docker build -t ${IMAGE} .
# restore users script
mv users.sql.pattern users.sql
