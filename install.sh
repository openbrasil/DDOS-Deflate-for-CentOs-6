#!/bin/bash
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6 + Mod 2.0 CENTOS'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf https://raw.githubusercontent.com/stylersnico/DDOS-Deflate-for-CentOs-6/master/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE https://raw.githubusercontent.com/stylersnico/DDOS-Deflate-for-CentOs-6/master/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list https://raw.githubusercontent.com/stylersnico/DDOS-Deflate-for-CentOs-6/master/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh https://raw.githubusercontent.com/stylersnico/DDOS-Deflate-for-CentOs-6/master/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo -n '.'
wget -q -O /usr/local/ddos/update.sh https://raw.githubusercontent.com/stylersnico/DDOS-Deflate-for-CentOs-6/master/update.sh
chmod 0755 /usr/local/ddos/update.sh
wget -q -O /usr/local/ddos/white.list https://raw.githubusercontent.com/stylersnico/DDOS-Deflate-for-CentOs-6/master/white.list
chmod 0755 /usr/local/ddos/white.list
echo '...done'

echo; echo -n 'Creating cron to update scrit each month'
crontab -l | { cat; echo "30 12 1-7 * 7 /usr/local/ddos/update.sh >> /var/log/deflate-update.log"; } | crontab -
echo '.....done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh -c
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'New White List file is at /usr/local/ddos/white.list'
echo 'Please send in your comments and/or suggestions to contact@nicolas-simond.com'
