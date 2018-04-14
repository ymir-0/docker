. configuration.sh
# ask user for settings
# apply user settings to Dockerfile
# allow to edit shared volumes
# create image
docker build -t ${IMAGE} .
# restore Dockerfile
