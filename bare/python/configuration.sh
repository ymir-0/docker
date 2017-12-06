PREFIX="bare"
NAME="python"
# DOCKER_ID_USER is your docker ID and should be defined at linux session startup
IMAGE=${DOCKER_ID_USER}"/"${PREFIX}"_"${NAME}
CONTAINER=${DOCKER_ID_USER}"_"${PREFIX}"_"${NAME}
REPOSITORY=${IMAGE}
