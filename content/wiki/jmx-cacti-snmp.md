+++
date = "2009-05-05"
draft = false
title = "JMX Cacti snmp"
color = "lime"
icon = "hacker-news"
Tags = [ "mediawiki"]
description = "JMX Cacti snmp"
+++

Quand java, JMX, cacti et snmp sont dans un bateau ... ça c'était l'idée
de départ, finalement, c'est beaucoup plus simple d'activer le snmp
directement dans la jvm ...

voici donc quelques notes pour faire de beau graphes de machines
virtuelles java avec cacti.

### Principe

Après avoir activer snmp sur la jvm, on configure le serveur snmp local
pour faire proxy.

### Mise en œuvre

Ajouter ces options pour le lancement de la jvm, pour tomcat ça ce passe
dans /etc/default/tomcat5.5 ou /etc/default/tomcat6

    -Dcom.sun.management.snmp.port=$PORT -Dcom.sun.management.snmp.acl.file=/etc/tomcatX/snmp.acl

Modifier le /etc/tomcatX/snmp.acl

    acl = {
       {
         communities = public
         access = read-only
         managers = localhost
       }
    }

Changer les droits, la jvm est très strict à ce sujet

    chmod 400 /etc/tomcatX/snmp.acl
    chown tomcatX /etc/tomcatX/snmp.acl

Enfin ajouter dans /etc/snmp/snmpd.conf

    proxy -v 2c -c public localhost:9161 .1.3.6.1.4.1.42

### En vrac

Téléchargement de jmxquery :
<http://code.google.com/p/jmxquery/downloads/list> à décompresser dans
/usr/local/share/jmxquery-1.0/

    mkdir /usr/local/share/jmxquery-1.0/
    cd /usr/local/share/jmxquery-1.0/
`wget `[`http://jmxquery.googlecode.com/files/jmxquery-1.0.tar.gz`](http://jmxquery.googlecode.com/files/jmxquery-1.0.tar.gz)\
    tar -xzvf jmxquery-1.0.tar.gz
    chmod +x check_jmx
    rm jmxquery-1.0.tar.gz
    cd ../
    ln -s jmxquery-1.0 jmxquery
