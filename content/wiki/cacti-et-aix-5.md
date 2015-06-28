+++
date = "2007-05-16"
draft = false
title = "Cacti et Aix 5"
color = "green"
icon = "gear"
Tags = ["trucs et astuces", "mediawiki"]
description = "Cacti et Aix 5"
+++

Pour faire de jolie graphs de machine AIX 5 dans cacti, mais aussi pour
avoir tout plein d'info dans Oreon (nagios).

Sur l'AIX dans le fichier /etc/snmpdv3.conf changer la ligne :

     VACM_VIEW defaultView        1.3.6.1.4.1.2.6.191       - excluded -

par

     VACM_VIEW defaultView        1.3.6.1.4.1.2.6.191        - included -

relancer le service

     stopsrc -s snmpd
     startsrc -s snmpd
     stopsrc -s aixmibd
     startsrc -s aixmibd
