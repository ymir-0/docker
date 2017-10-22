IMAGE_CONTAINER_NAME="apache_php_perso"
docker build -t ${IMAGE_CONTAINER_NAME} .
docker run --name ${IMAGE_CONTAINER_NAME} -d -v ~/docker/apache_php/html:/var/www/html -p 80:80 ${IMAGE_CONTAINER_NAME} /bin/sh -c "service apache2 start ; tail -f /dev/null"
