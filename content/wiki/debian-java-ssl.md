+++
date = "2011-06-15"
draft = false
title = "Debian java ssl"
color = "green"
icon = "user-times"
Tags = [ "mediawiki"]
description = "Debian java ssl"
+++

dans toutes les docs java pour ajouter un certificats racine dans le
keystore de java il faut faire :

    keytool -import -trustcacerts -alias 'mon_alias' -file mon_alias.pem

Seulement sous debian et ubuntu, cette action à une durée de vie limité.
En effet à la mise à jour du paquet ca-certificates l'ensemble des
portes clés des différentes applications de la machine sont reconstruit
... enfin quand la commande "update-ca-certificates -f" est lancé. C'est
le packet ca-certificates-java qui s'occupe de ça.

La bonne méthode consiste donc à s'interfacer avec ca-certificates :

-   dépos du fichier pem dans /etc/ssl/certs
-   lancement de update-ca-certificates -f

