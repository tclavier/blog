+++
date = "2006-10-20"
draft = false
title = "SpeetouchUSB debian et free dégroupé"
color = "deep-purple"
icon = "external-link"
Tags = ["trucs et astuces","linux", "mediawiki"]
description = "SpeetouchUSB debian et free dégroupé"
+++

Face à un problème de poid : l'alimentation de ma freebox à cramé, je me
suis retrouvé a essayer de configurer mon ancien modem SpeedTouch USB
sur ma debian préféré ... Vaste programme. Voici donc un petit tuto pour
ceux qui en auraient besoin.

Avant toute chose, débranchez bien votre freebox ou tout autre modem de
votre installation téléphonique. Un modem qui n'est pas alimenté, mais
branché sur une ligne téléphonique va fortement perturber le modem qui
doit fonctionner.

### Marche à suivre

sur une sarge, le noyau par défaut est incapable de charger tout seul le
firmware de la bête (\< 2.6.10), il faut donc installer le driver
adéquoite.

     apt-get install speedtouch

le paquet speedtouch intègre les fichiers hotplug qui vont
automatiquemenent charger le firmware au branchement du modem et monter
l'interface réseau. Configurons tout ça.

-   téléchargement du firmware
    <http://www.speedtouchdsl.com/dvrreg_lx.htm>
-   le décompresser dans /usr/local/lib/speedtouch/ ce qui nous donne
    les fichiers KQD6\_3.012 et ZZZL\_3.012
-   Dans le fichier /etc/default/speedtouch commenter PPPD\_PEER et
    ajouter la ligne suivante :

     NET_IF="atm0"

installer le paquet atm-tools

     apt-get install atm-tools

modifier le fichier /etc/network/interfaces pour configurer votre
nouvelle interface atm0

      
    iface atm0 inet static
            adresse IP_FREE
            netmask 255.255.255.0
            gateway PASSERELLE
            mtu 1500
            pre-up /sbin/atmarp -c atm0 || exit 0
            up /sbin/atmarp -s PASSERELLE 8.36 null

Certains logiciels comme shorewall ou tinc utilisent le nom de
l'interface réseau, donc ne pas oublier de les modifiers. Pour
shorewall, il faut modifier /etc/shorewall/interfaces et
/etc/shorewall/masq

Reste plus qu'a brancher le modem.

### Questions remarques

-   je ne sais pas bien ou placer le atmarp -c 0
-   il reste peut-être un bug sur le "REMOVER" du paquet speedtouch, à
    voir

