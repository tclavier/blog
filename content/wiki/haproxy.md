+++
date = "2013-01-03"
draft = false
title = "Haproxy"
color = "green"
icon = "trash"
Tags = [ "mediawiki"]
description = "Haproxy"
+++

Tunning HAProxy sur debian

par défaut, syslog-ng sur debian n'écoute que sur la socket unix
/dev/log, pour activer les logs haproxy il faut donc :

     log /dev/log daemon
