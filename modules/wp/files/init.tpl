#!/bin/bash
apt-get update
apt-get install apache2  libapache2-mod-php7.0 php7.0-mysql wget curl mysql-client -y


cd /tmp/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html
rm index.html
wp --allow-root core download --version=4.7
chown www-data /var/www/html -R
cp wp-config-sample.php wp-config.php

sed -i s/"database_name_here"/"${db_name}"/ /var/www/html/wp-config.php
sed -i s/"username_here"/"${user_name}"/ /var/www/html/wp-config.php
sed -i s/"password_here"/"${password}"/ /var/www/html/wp-config.php
sed -i s/"localhost"/"${host_name}"/ /var/www/html/wp-config.php

echo "<?php echo 'healthy'; ?>" > /var/www/html/healthcheck.php


cd /var/www/html
wp --allow-root db tables >/dev/null
retval=$?

if [ "$retval" -ne "0" ]
then
	#This will populate the database only if it does not exists
	wp --allow-root core install --url=${elb_url} --title="Page title" --admin_user="admin" --admin_password="${password}" --admin_email="m.arranz.perez@gmail.com" --path=/var/www/html/
fi






#This will run only first time, if the hello world post is not present


hello_post_present=$(wp --allow-root post list --field=post_title|grep "Hello world!"|wc -l)
if [ "$hello_post_present" -ne "0" ]
then
	wp --allow-root post delete 1
	wp --allow-root post create --post_type=post --post_title='Lorem ipsum' --post_content="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. <img src='https://img.discogs.com/jKTmuxcsYe2TqcahU3QqVXJLssU=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-1873013-1471100381-3022.jpeg.jpg'>" --post_status=publish
fi

wait 10
service apache2 restart
