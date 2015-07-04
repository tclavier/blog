+++
date = "2009-11-02"
draft = false
title = "Cacti"
color = "grey"
icon = "check-circle-o"
Tags = [ "mediawiki"]
description = "Cacti"
+++

Cacti est un merveilleux outils pour suivre l'activité d'un ensemble de
machines. Voici quelques truc pour activer cacti sur certaines
applications

apache
------

ajouter le script ws\_apachestats.pl (plus d'info ici :
<http://forums.cacti.net/about9861-0-asc-0.html>)

`wget `[`http://forums.cacti.net/download.php?id=301`](http://forums.cacti.net/download.php?id=301)` -O /tmp/apachestats-0.4.zip`\
    unzip /tmp/apachestats-0.4.zip
    cp apachestats-0.4/scripts/ws_apachestats.pl /usr/local/share/cacti/scripts/
    ln -s /usr/local/share/cacti/scripts/ws_apachestats.pl /usr/share/cacti/site/scripts/

Ajouter la lib manquante

    apt-get install libwww-perl

Ajouter le xml des graphes
