+++
date = "2007-12-04"
draft = false
title = "Jwchat et lighttpd"
color = "grey"
icon = "sign-in"
Tags = ["linux", "mediawiki"]
description = "Jwchat et lighttpd"
+++

2 ou 3 notes sur l'installation et la configuration de Jwchat sur un
serveur debian avec lighttpd.

[Jwchat](http://jwchat.sourceforge.net/) est un client jabber web c'est
à dire que depuis un navigateur vous pouvez profiter de tous les
avantages de votre messagerie instantané.

[lighttpd](http://www.lighttpd.net/) est un serveur web ultra léger et
rapide.

Récupérer l'archive de jwchat et la décompresser

` wget `[`http://prdownloads.sourceforge.net/jwchat/jwchat-1.0beta3.tar.gz?download`](http://prdownloads.sourceforge.net/jwchat/jwchat-1.0beta3.tar.gz?download)\
     tar -xzvf jwchat-1.0beta3.tar.gz

activer le mode proxy et le configurer pour taper sur le serveur jabber
pour toutes les requêtes de la forme <http://monserveur/http-poll/>

     lighty-enable-mod proxy 
     vi /etc/lighttpd/lighttpd.conf
     proxy.server = ( "/http-poll/" =>
                      ( (
                          "host" => "127.0.0.1",
                          "port" => 5280
                      ) )
                    )
     /etc/init.d/lighttpd force-reload

Configurer jwchat voir la doc dans le README

     vi config.js

Et là ça ne fonctionne pas ... le hic c'est que lighttpd ne prend pas en
charge l'internationalisation comme apache c'est à dire que si le
navigateur fait un get de toto.html avec comme langue annoncé FR,
lighttpd ne va pas commencer par chercher le fichier toto.html.fr il
cherche tout de suite toto.html ... qui n'existe pas. Or
l'internationalisation de jwchat repose sur ce principe donc par défaut
ça ne fonctionne pas. J'ai donc supprimé l'extension .fr de tous les
fichiers. Je me retrouve avec un jwchat exclusivement en français.

``  for file in `ls *.fr`; do cp $file `echo $file |sed -e 's/.fr//g'`; done ``

Voilà et maintenant vous pouvez profiter de
[jwchat](http://jabber.tcweb.org/jwchat/) en Français sur tcweb.org,
uniquement pour le serveur jabber.tcweb.org
