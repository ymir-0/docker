#!/bin/sh
# INFO : this script create a docker containers with all PirateBox services
# it is a fork of the one at : repo https://github.com/PirateBox-Dev/PirateBoxScripts_Webserver.git, folder piratebox/lib

# Matthias Strubel (c) 2013 - GPL3

convert_yn_to_tf(){
	local value=$1 ; shift
	if [ "${value}" = "yes" ] ; then 
		echo "true"
	else
		echo "false"
	fi
}
