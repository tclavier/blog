+++
date = "2011-04-27"
draft = false
title = "Monit"
color = "blue"
icon = "university"
Tags = [ "mediawiki"]
description = "Monit"
+++

Quelques notes sur l'utilisation de monit sur une debian

    apt-get install monit
    vi /etc/default/monit
    vi /etc/monit/monitrc

vi /etc/monit/conf.d/apache2

    check process apache2 with pidfile /var/run/apache2.pid
      start program = "/etc/init.d/apache2 start"
      stop program  = "/etc/init.d/apache2 stop"
      if failed host localhost port 80 protocol HTTP then restart

vi /etc/monit/conf.d/exim4

    check process exim4 with pidfile /var/run/exim4/exim.pid
      start program = "/etc/init.d/exim4 start"
      stop program = "/etc/init.d/exim4 stop"
      if failed host 127.0.0.1 port 25 protocol smtp then restart

vi /etc/monit/conf.d/snmpd

    check process snmpd with pidfile /var/run/snmpd.pid
      start program = "/etc/init.d/snmpd start"
      stop program = "/etc/init.d/snmpd stop"
      if failed host 127.0.0.1 port 161 type udp then restart

vi /etc/monit/conf.d/mysql

    check process mysql with pidfile /var/run/mysqld/mysqld.pid
      start program = "/etc/init.d/mysql start"
      stop program  = "/etc/init.d/mysql stop"
      if failed host localhost port 3306 protocol mysql then restart

vi /etc/monit/conf.d/ssh

    check process sshd with pidfile /var/run/sshd.pid
      start program = "/etc/init.d/ssh start"
      stop program  = "/etc/init.d/ssh stop"
      if failed host localhost port 22 protocol ssh then restart

    monit -t
    /etc/init.d/monit restart
