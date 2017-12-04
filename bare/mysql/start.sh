. configuration.sh
docker start ${CONTAINER}
docker exec -it ${CONTAINER} /bin/bash -c "service mysql restart" # force restart to synchronize "/var/lib/data" folder rights
