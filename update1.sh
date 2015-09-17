#!/bin/bash
# Automated installation for Fos-streaming panel - http://fos-streaming.com/
# Source: git clone https://github.com/zgelici/FOS-Streaming.git

echo -n "Updating FOS-Streaming"
rm -r /usr/src/FOS-Streaming
cd /usr/local/nginx/html
mv /usr/local/nginx/html/config.php /tmp/
rm -r /usr/local/nginx/html/*
cd /usr/src/
git clone https://github.com/zgelici/FOS-Streaming.git
cd /usr/src/FOS-Streaming/
mv /usr/src/FOS-Streaming/* /usr/local/nginx/html/
mv /tmp/config.php /usr/local/nginx/html
cd /usr/local/nginx/html/
php /usr/src/composer.phar install
mkdir /usr/local/nginx/html/hl
chmod -R 777 /usr/local/nginx/html/hl
mkdir /usr/local/nginx/html/cache
chmod -R 777 /usr/local/nginx/html/cache
curl "http://127.0.0.1:8000/install.php?install"
curl "http://127.0.0.1:8000/install.php?update" 
echo "[x]"
echo "You need to run a manually an update of your database if you have a different port then 8000"
echo 'run the command curl "http://127.0.0.1:port/install.php?install" and curl "http://127.0.0.1:8000/install.php?update"'
echo "or just visit with your browser to http://host:port/install.php?install and http://host:port/install.php?update".
echo "after updating database you can remove /usr/local/nginx/html/install.php "


