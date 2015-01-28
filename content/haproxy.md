Title:Haproxy
Date:2013-01-03
Tags:  mediawiki

Tunning HAProxy sur debian

par défaut, syslog-ng sur debian n'écoute que sur la socket unix
/dev/log, pour activer les logs haproxy il faut donc :

` log /dev/log daemon`

