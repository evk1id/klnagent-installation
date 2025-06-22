#!/usr/bin/bash

#--install perl
dnf install -y perl-Getopt-Long perl-File-Copy
#
#--install agent
dnf install -y klnagent*.rpm
#
#--KSC-server IP-address
echo "Please enter Administration Server IP-address: "
read ipaddress
#
#--parameters
sudo echo "KLNAGENT_AUTOINSTALL=1
EULA_ACCEPTED=1
KLNAGENT_SERVER=$ipaddress
KLNAGENT_PORT=14000
KLNAGENT_SSLPORT=13000
KLNAGENT_USESSL=1
KLNAGENT_GW_MOD=1" > /opt/klnagent.ini
export KLAUTOANSWERS="/opt/klnagent.ini"
#
#--version
version="$(uname -m)"
if [[ $version="x86_64" ]];
then
	/opt/kaspersky/klnagent64/lib/bin/setup/postinstall.pl
else
	/opt/kaspersky/klnagent/lib/bin/setup/postinstall.pl
fi
