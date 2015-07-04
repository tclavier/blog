+++
date = "2013-05-15"
draft = false
title = "Astuces subversion"
color = "indigo"
icon = "forumbee"
Tags = [ "mediawiki"]
description = "Astuces subversion"
+++

Quelques truc et astuces sur subversion alias svn

Proxy
-----

Nativement svn supporte 4 modules d'accès :

-   ra\_neon : comme son nom l'indique il utilise la librairie neon pour
    le protocole webdav en http et https avec ou sans proxy. Pour les
    urls de la forme <http://> ou <https://>
-   ra\_svn : protocole réseau propre à svn, pour les urls en <svn://>
-   ra\_local : accès à un dépôt sur le disque local
-   ra\_serf : pour les accès à des dépôts avec le protocole webdav avec
    serf

### Cas du http

Ce cas est très simple, c'est la lib neon qui se charge de tout.

En modifiant le fichier de configuration :

-   Pour Windows : %USERPROFILE%\\Application Data\\Subversion\\servers
-   Pour Linux et cygwin : \~/.subversion/servers

Dans la section [global] :

    [global]
    http-proxy-host = serveur-proxy
    http-proxy-port = port
    http-proxy-username = utilisateur
    http-proxy-password = mot_de_passe

### Cas du svn

Là c'est plus compliqué, il faut utiliser la notion de tunnel. Ce
qu'openssh appel un commande proxy (ProxyCommand). Par défaut il
n'existe qu'un tunnel le ssh que l'on retrouve dans les urls de la forme
svn+ssh:// dans notre cas nous allons utiliser corkscrew ou connect (une
alternative à corkscrew disponible sous centos et redhat).

Nous allons donc définir un nouveau tunnel Dans le fichier de
configuration :

-   Pour Windows : %USERPROFILE%\\Application Data\\Subversion\\config
-   Pour Linux et cygwin : \~/.subversion/config

Dans la section [tunnels]

    [tunnels]
    proxy = /chemin/vers/wrapper

/chemin/vers/wrapper sera alors appeler pour toutes les urls de la forme
svn+proxy://serveur/projet avec en paramètres "serveur svnserve -t"
cette syntax n'étant pas nativement compatible avec corkscrew ou connect
on est obligé de passer par un wrapper.

Voici le contenu du wrapper pour corkscrew

    #!/bin/bash
    /usr/bin/corkscrew proxy 3128 $1 3690

Voici le contenu du wrapper pour connect

    #!/bin/bash
`/usr/bin/connect -H `[`proxy:3128`](proxy:3128)` $1 3690`

maintenant il suffit de faire un svn co svn+proxy://serveur/projet, par
exemple pour faire un checkout du projet samhain :

    svn checkout svn+proxy://svn.la-samhna.de/samhain/trunk/

Admin
-----

Créer un nouveau projet :

    svnadmin create /var/lib/svn/projet
    svn mkdir http://svn.tcweb.org/projet/trunk \
    http://svn.tcweb.org/projet/branches \
    http://svn.tcweb.org/projet/tags \
    -m "Création des répertoires d'archivage Subversion."
