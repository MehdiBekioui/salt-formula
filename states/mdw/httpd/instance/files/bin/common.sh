#!/bin/sh

USAGE="Usage: common.sh <action>\n\t<action>: start, stop, restart"

if [ $# -ne 1 ]; then echo "$USAGE"; exit 1; fi;
if [ $1 != "start" ] && [ $1 != "stop" ] && [ $1 != "restart" ]; then echo "$USAGE"; exit 1; fi;

{{ installDir }}/bin/httpd -k $1 -d {{ instanceDir }} -f conf/httpd.conf