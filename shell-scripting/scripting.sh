#!/bin/bash

site=$1
VirtualHost=$2
if[-d "~/sandbox/Adminf/DocumentRoot"]
then
 echo "127.0.1.1 $site.local" >> "/etc/hosts"
else 
then
mkdir -p "~/sandbox/Adminf/DocumentRoot" 
fi

if(-d "/etc/apache/sites-available/$VirtualHost.local.host")
then 
echo "<VirtualHost*:80>" >> "$VirtualHost.local.conf"
echo "ServerName www.$site.local" >> "$VirtualHost.local.conf"
echo "ServerAlias $site.local" >> "$VirtualHost.local.conf"
echo "DocumentRoot /var/www/adminf" >> "$VirtualHost.local.conf"
echo "</VirtualHost>" >> "$VirtalHost.local.conf"
else
then
touch "/etc/apache2/sites-availble/$VirtualHost.local.conf"
fi

sudo "/etc/init.d/apache2 restart"


