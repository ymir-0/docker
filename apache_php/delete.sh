. configuration.sh
docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}
docker rmi ${IMAGE_NAME}
