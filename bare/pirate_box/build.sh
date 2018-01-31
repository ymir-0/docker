. configuration.sh
# ask user for settings
echo "forum settings"
echo -n "admin password : " && read ADMIN_PASSWORD
echo -n "secret : " && read SECRET
# apply user settings to configuration
cp scripts/config.pl scripts/config.pl.pattern
sed -i s/"{ADMIN_PASSWORD}"/${ADMIN_PASSWORD}/g scripts/config.pl
sed -i s/"{SECRET}"/${SECRET}/g scripts/config.pl
# create image
docker build -t ${IMAGE} .
# restore Dockerfile
mv scripts/config.pl.pattern scripts/config.pl
