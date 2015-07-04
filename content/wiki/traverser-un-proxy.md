+++
date = "2008-04-29"
draft = false
title = "Traverser un proxy"
color = "amber"
icon = "road"
Tags = ["trucs et astuces", "mediawiki"]
description = "Traverser un proxy"
+++

L'objectif de cette page c'est d'expliquer comment faire passer autre
chose que de l'http ou de l'https à travers un proxy qui ne semble
savoir faire que ça.

Un peu de théorie
-----------------

### Le proxy

La traduction française de "proxy server" c'est "serveur mandataire"
même si cette traduction est rarement utilisé, elle caractérise bien la
fonction d'un proxy : être mandaté par un client pour aller chercher sur
internet les documents demandés.

### Les protocoles

#### http et https

Pour naviguer sur internet avec votre navigateur préféré, les
communications utilisent le protocole http. Pour tous les sites
demandant des échanges sécurisés, un protocole a été inventé l'https. Il
s'agit en fait d'http crypté.

Dans le cas de l'https, le serveur proxy ne peut absolument pas jouer
son rôle de mandataire, en effet, le protocole garanti un échange
sécurisé entre le client et le serveur, c'est à dire que tous les
intermédiaires, y compris le serveur proxy ne voient qu'un flux
indécryptable.

habituellement, un serveur sachant parler l'http écoute sur le port TCP
80, et un serveur sachant parler l'https écoute sur le port 443.

#### ssh

Le ssh est l'abréviation de "secure shell" il s'agit d'un protocole
sécurisé d'accès distant à une machine. C'est une sorte de telnet ou
rlogin sécurisé.

De la même façon que l'https, le ssh garantit des échanges totalement
sécurisés. Il apporte tout de même un gros avantage, celui de pouvoir
[faire un tunnel ssh](faire un tunnel ssh "wikilink") c'est à dire faire
transiter par la connection sécurisée tout autre protocole de
communication.

Le standard pour un serveur ssh, c'est d'écouter sur le port 22.

### Ce qui va se passer

Vous l'avez sans doute compris, l'astuce consiste à faire passer du ssh
à la place de l'https. Dans les deux cas, le serveur proxy ne voit qu'un
flux crypté.

Nous allons donc utiliser un client ssh coté client (derrière le proxy)
et un serveur ssh coté serveur.

Enfin la pratique
-----------------

### ssh ou https

Pour le serveur proxy, la seul façon de vérifier que la communication
est bien en https, c'est d'une part de faire confiance au client qui
demande l'établissement d'une connections https, et d'autre part, de
vérifier que la communication est bien à destination d'un serveur sur le
port 443.

Certains serveurs proxy ne vérifient que le le premier point.

Pour demander au proxy l'établissement d'une connections https depuis
son client ssh, il y a 2 solutions : [Corkscrew](/wiki/corkscrew)
ou l'option proxy de [PuTTY](/wiki/putty)

### [Corkscrew](/wiki/corkscrew)

Sous linux, ou [Cygwin](/wiki/cygwin) (Windows) le plus simple
c'est d'utiliser [Corkscrew](/wiki/corkscrew) pour ce faire, rien
de plus simple , commencer par installer le logiciel avec votre
gestionnaire de paquet favoris, sous Debian :

     apt-get install corkscrew

Pour ce qui est de la configuration, rajoutons l'appel à
[corkscrew](corkscrew "wikilink") dans le fichier de configuration de
ssh. Chez moi, ça donne quelque chose comme ça :

     ProxyCommand corkscrew Nom_du_proxy 3128 %h %p

Avec Nom\_du\_proxy qui est le nom ou l'ip du serveur proxy et 3128 le
port d'écoute du proxy.

### [PuTTY](/wiki/putty)

![](Putty_proxy.png "fig:Putty_proxy.png") Comme dans l'illustration à
droite, cherchez dans le menu de gauche, l'entrée "Connections -\>
Proxy" et remplir les champs comme demandé. Si vous ne savez pas
exactement quel est le type de proxy, je vous conseil de commencer par
"http" c'est le plus courant.

### côté serveur

Si votre serveur proxy ne laisse passer que les connections https à
destination du port 443, il va falloir installer votre serveur ssh sur
le port 443. Sous linux, vous avez 2 solutions :

-   changer le port d'écoute dans le fichier de configuration de sshd.
-   rajouter dans inetd le service sshd sur le port 443.

Pour la première solution, il faut changer l'option Port dans le fichier
/etc/ssh/sshd\_config

     Port 443

Inetd n'existant pas par défaut sous windows, il n'y a que cette option
de facilement réalisable.

Pour la seconde solution, ajoutez la ligne suivante dans votre fichier
/etc/inetd.conf

     https   stream  tcp     nowait  root    /usr/sbin/tcpd /usr/sbin/sshd -i

Conclusion
----------

Pour finir, une fois que vous aurez établis la connections ssh, vous
pourrez en [réalisant un tunnel ssh](faire un tunnel ssh "wikilink") y
faire passer tout ce que vous voulez par exemple du
[vnc](vnc "wikilink") des news, du mail, et même du vpn :-)

Enfin, voici mon fichier de configuration ssh.

    Host tcweb.org
      ProxyCommand corkscrew 192.168.12.1 3128 %h %p
      Port 443
