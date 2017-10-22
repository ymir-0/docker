docker build -t apache_php_perso .
docker run --name apache_php_perso -d -v ~/docker/apache_php/html:/var/www/html -p 80:80 apache_php_perso /bin/sh -c "service apache2 start ; tail -f /dev/null"

