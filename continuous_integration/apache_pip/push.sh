. configuration.sh
docker login -u ${DOCKER_ID_USER} -p ${DOCKER_ID_PASSWORD}
docker push ${REPOSITORY}
docker logout
