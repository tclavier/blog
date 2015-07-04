+++
date = "2006-11-17"
draft = false
title = "Paquet debian xxx-source"
color = "lime"
icon = "chevron-down"
Tags = [ "mediawiki"]
description = "Paquet debian xxx-source"
+++

le gros avantage avec les paquets debian en xxx-source c'est la
simplicité d'installation :

     module-assistant a-i xxx

et hop voilà le module compilé et installé pour le noyau en cours ...
seulement pour les modules qui sont en cours de développement, ça pose
problème ... le cvs est beaucoup plus à jour. Donc Voici comment je fait
pour refaire un paquet à jour. L'exemple est pour le paquet
rt2x00-source.

Installé le paquet source :

     cd /usr/src
     apt-get source rt2x00-source
     apt-get build-dep rt2x00-source

récupéré la dernière archive CVS :

` wget `[`http://rt2x00.serialmonkey.com/rt2x00-cvs-daily.tar.gz`](http://rt2x00.serialmonkey.com/rt2x00-cvs-daily.tar.gz)

installer les outils de développement debian

     apt-get install devscripts

renommer le tar.gz avec le nouveau numéro de version :

``  mv rt2x00-cvs-daily.tar.gz rt2x00_0cvs`date +%Y%m%d`.tar.gz ``

se placer dans le répertoire de la version en cours et lancer la mise à
jour :

     cd rt2x00-0cvs20060928
``  uupdate -u ../rt2x00_0cvs`date +%Y%m%d`.tar.gz ``

se déplacer dans le répertoire du nouveau paquet et lancer la
compilation du .deb

``  cd ../rt2x00-0cvs`date +%Y%m%d` ``\
     dpkg-buildpackage

reste plus qu'a installer le nouveau paquet, et à lancer la compilation
du nouveau module

``  dpkg -i ../rt2x00-source_0cvs`date +%Y%m%d`-1_all.deb ``\
     module-assistant a-i rt2x00
