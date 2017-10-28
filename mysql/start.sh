. configuration.sh
docker start ${CONTAINER}
docker exec -it ${CONTAINER} /bin/bash -c "service mysql restart; sleep 10"
