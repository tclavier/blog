+++
date = "2005-12-21"
draft = false
title = "Dossier technique linux"
color = "orange"
icon = "hand-o-left"
Tags = ["pole logiciels libres", "mediawiki"]
description = "Dossier technique linux"
+++

Introduction
------------

### i) Qu'est ce qu'un DT ?

"Dossier Technique Linux". De biens grands mots ... Mais à quoi va
servir ce document ? Il existe deux catégories d'utilisateurs : initié
et non initié. C'est pourquoi, chaque document technique sera découpé en
deux parties : une première de quelques pages, donnant un aperçu du
sujet traité. Une seconde partie plus complète fournissant des
informations pour une utilisation avancée de l'outil.

Une fois ce document lu, vous aurez :

-   soit les moyens nécessaires pour faire fonctionner simplement un
    outil (web, ftp, ...)
-   soit les détails nécessaires à la comprehension du système Linux

### ii) Qu'est ce que Linux ?

GNU/Linux est un système d'exploitation qui se comporte comme un UNIX et
qui implémente les spécifications POSIX, avec des extensions système V
et Berkeley. Les principales caractéristiques de Linux sont les
suivantes :

-   Multitâches : exécute plusieurs programmes en même temps
-   Multi-utilisateurs : plusieurs utilisateurs peuvent être actifs en
    même temps
-   Multi plates-formes : Linux peut fonctionner avec différents types
    de processeurs (Intel, Sparc, Alpha, PowerPC, m68k, etc.)
-   Supporte un grand nombre de systèmes de fichiers : Ext2, Ext3,
    ReiserFS, xfs, vfat, jfs, etc.
-   Dispose d'une couche réseau très évolué.

Comme Microsoft Windows, le noyau Linux est dit monolitique, c'est à
dire que malgré la diversité des tâches qui lui incombent, il est seul à
les réaliser. A l'inverse des systèmes comme GNU/Hurd qui s'articulent
autour d'un micronoyau et de multiples processus capables de gérer la
mémoire, les disques ou tout autre matériel.

### iii) Choix des distributions

GNU/Linux est un système d'exploitation qui se décline en de nombreuses
distributions. Elles ont chacunes leurs caractéristiques. Nous avons
choisis de baser les dossiers techniques sur deux distributions : RedHat
et Debian. Les raisons sont simples : Red Hat Enterprise est la
distribution de référence dans le monde professionnel. Debian est celle
qui représente le mieux la communauté du libre : fiable, configurable à
volonté, sécurisé, facile à administrer, très modulaire et supporté par
aucune grosse société

1 - Installation
----------------

Avant toute chose, il convient d'installer l'une ou l'autre des
distributions proposées afin de pouvoir utiliser un quelconque outil.
Pour se faire, munissez-vous du/des CDROM d'installation correspondantes
à la RedHat ou à la Debian et suivez le mode opératoire adéquat :

### 1.1 - Installation d'une RedHat

Une page spéciale est dédié à cette opération : [Mode Operatoire RHE AS
3.0](/wiki/mode-operatoire-rhe-as-3-0)

### 1.2 - Installation d'une Debian

2 - Utilisation simple
----------------------

Maintenant que le système est installé, loguez-vous en entrant le login
et le mot de passe que vous avez précédemment configuré et laissez-vous
guider.

### 2.1 - Les processus

Chaque programme lancé sur le système est identifiable par un ou
plusieurs processus. Un processus est défini par un ensemble
d'instructions et un espace mémoire.

Le sens de processus doit être pris comme quelque chose qui prend du
temps, donc qui a un début et (parfois) une fin. Un processus peut-être
démarré par un utilisateur par l'intermédiaire d'un périphérique ou bien
par un autre processus : les applications des utilisateurs sont des
(ensembles de) processus.

Pour communiquer avec un processus, il est possible d'utiliser des
signaux mais aussi des segments de mémoires partagés et bien d'autres
outils en règle générale uniquement accessible aux programmeurs. Sous
Linux, il existe 15 signaux les plus connues sont le SIGKILL pour
stopper coute que coute un processus et le SIGTERM pour lui demander
gentiment de s'arrêter.

Un processus sous Linux à un identifiant (PID) et un père (PPID). Son
père est le processus qui lui a donné naissance (on parle alors de
fork).

Tous les processus d'un ordinateur tournent les uns après les autres
durant un petit laps de temps géré par le noyau. C'est ainsi que l'on
obtient du multi-tâche.

Regardons quels sont les processus qui tournent actuellement sur notre
machine. Pour se faire entrer la commande suivante :

     ps -eaf ou ps -auwx 

voici un exemple de sortie écran que l'on obtient avec cette commande :

    UID        PID  PPID  C STIME TTY          TIME CMD
    root         1     0  0 18:31 ?        00:00:00 init [2]
    root         2     1  0 18:31 ?        00:00:00 [keventd]
    root         3     1  0 18:31 ?        00:00:00 [ksoftirqd_CPU0]
    root         4     1  0 18:31 ?        00:00:00 [kswapd]
    root         5     1  0 18:31 ?        00:00:00 [bdflush]
    root         6     1  0 18:31 ?        00:00:00 [kupdated]
    root        47     1  0 18:31 ?        00:00:04 [kjournald]
    root       175     1  0 18:31 ?        00:00:00 [kcopyd]
    root       420     1  0 18:31 ?        00:00:00 [khubd]
    root       870     1  0 18:31 ?        00:00:00 /sbin/syslogd
    root       873     1  0 18:31 ?        00:00:00 /sbin/klogd
    root       911     1  0 18:31 ?        00:00:00 /usr/sbin/inetd
    daemon     915     1  0 18:31 ?        00:00:00 /usr/sbin/atd
    root       918     1  0 18:31 ?        00:00:00 /usr/sbin/cron
    root       925     1  0 18:31 tty2     00:00:00 /sbin/getty 38400 tty2
    root       926     1  0 18:31 tty3     00:00:00 /sbin/getty 38400 tty3
    daemon    3165     1  0 18:39 ?        00:00:00 /sbin/portmap
    root      3199     1  0 18:39 ?        00:00:00 /sbin/rpc.statd
    root      3927     1  0 18:42 tty4     00:00:00 /sbin/getty 38400 tty4
    root      3931     1  0 18:42 tty5     00:00:00 /sbin/getty 38400 tty5
    root      3932     1  0 18:42 tty6     00:00:00 /sbin/getty 38400 tty6
    root      7629     1  0 19:04 tty1     00:00:00 /sbin/getty 38400 tty1
    root      7638  7634  0 19:05 pts/1    00:00:00 ps -eaf

La première colonne donne le nom de l'utilisateur qui a lancé le
processus. La deuxième donne l'identifiant du processus : son PID La
troisième donne l'identifiant du processus parent : son PPID La dernière
donne le nom du processus et l'endroit où le programme correspondant
peut-être trouvé.

Tout en haut de cette exemple, on trouve le processus init. Son PID est
1 ce qui signifie que c'est le premier processus qui a été lancé. En
d'autres termes c'est le processus (grand-)père de tout les processus.
Terminer l'éxécution de ce processus revient à stopper le fonctionnement
de la machine.

Pour envoyer un signal à un processus, on utilisera la commande kill.
Donc pour stoper le processus 3165, nous utiliserons la commande :

     kill -15 3165 

ou

     kill -SIGTERM 3165

*gestion des processus (fork, thread, file d'attente, load) et de la
communication entre processus (signaux, sémaphore, zone mémoire
partégé)*

### 2.2 - Le système de fichier

Le système de fichier regroupe tous les fichiers et répertoire d'une
machine. Le système de fichier le plus courant actuellement se nomme
l'Extend 3 (EXT3). Les fichiers sont architecturés en répertoires et
sous-répertoires.

#### 2.2.1 - Les répertoires

La racine de cette architecture, c'est à dire le répertoire parent de
tous les fichiers et sous répertoire est le slash '/'. Pour connaitre le
répertoire où vous vous trouvez actuellement, entrez la commande
suivante :

     pwd

Logiquement, cette dernière devrait vous donner :

     /root

qui est le répertoire de l'administrateur ou (Supper Utilisateur) de la
machine. Pour connaitre la liste des fichiers et sous-répertoire de
l'endroit où vous vous trouvez, entrez la commande

     ls -l

Un exemple de sortie écran de cette commande peut-être :

    -rw-r--r-- 1 root root 188 2005-10-12 18:29 dbootstrap_settings
    -rw-r--r-- 1 root root 1336 2005-10-12 18:29 install-report.template
    drwxr-xr-x 2 root root 1024 2005-10-12 19:28 temp

Sans s'attarder sur ce que tout ce texte signifie, sachez juste que les
fichiers sont représentés par un '-' au début de chaque ligne et que les
sous-répertoires sont représentés par un 'd'. Pour parcourir les sous
répertoires, entrez la commande :

` cd `<répertoire>` (où `<répertoire>` est le nom du répertoire dans lequel vous voulez aller)`

Par exemple, pour aller dans le répertoire temp (indiqué par un 'd' en
début de ligne) il faudrait entrer la commande :

     cd temp   

Pour créer un répertoire, utilisez la commande :

` mkdir `<répertoire>

Pour supprimer un répertoire vide de contenu, utilisez la commande :

` rmdir `<répertoire>

A moins de vider complétement un répertoire de son contenu, il ne vous
sera pas possible de le supprimer avec cette commande. Toutefois,
utilisez la commande suivante si votre répertoire contient des objets
qui sont eux aussi à supprimer :

` rm -rf `<répertoire>

#### 2.2.2 - Les fichiers

Les fichiers et répertoires ont eux aussi un identifiant qui sont
stockés dans la **table d'allocation des fichiers**. C'est une table qui
contient la liste des identifiants de tous les fichiers et répertoires
d'un disque dur. Pour créer ou modifier un fichier texte, utilisez
l'éditeur vi en entrant la commande :

` vi `<nom du fichier>

vi est un éditeur très particulier, il a 2 mode de fonctionnement le
mode commande et le mode saisie. Dans le mode commande, l'appuis sur une
touche va effectuer une action, dans le mode saisie, l'appuis sur une
touche va ajouter le carractère correspondant au fichier.

Mémo des principales commandes à utiliser en mode commande :

-   **a** : passe ne mode saisie après le curseur
-   **i** : passe en mode saisie à l'endroit du curseur
-   **\$** : déplace le curseur en fin de ligne
-   **\^** : déplace le curseur en début de ligne
-   **w** : avance d'un mot
-   **:w** : enregistre
-   **:q** : quitte
-   **h,j,k,l** : déplace respectivement d'un carractère à gauche, en
    bas, en haut, à droite

Il existe beaucoup d'autre commandes très bien décrite dans l'aide.

Pour passer du mode saisie au mode commande, utilisez la touche Echap.

Afin de supprimer un fichier, utilisez la commande rm :

` rm `<nom du fichier>

Vous voilà prêt pour vous déplacer dans les répertoires et
modifier/créer d'eventuels fichiers ou répertoires. Toutes les commandes
précédemments utilisés possèdes des options (précédé d'un '-'). Obtenir
de l'aide sur une commande s'obtient grâce au **man**. Pour obtenir de
l'aide sur la commande mv par exemple, entrez :

     man mv

Une aide détaillée existe pour toutes les commandes du systèmes.

Une dernière commande util est celle qui vous permettra de déplacer vos
fichiers d'un répertoire à un autre. Pour se faire utiliser la commande
**mv**. Par exemple, pour déplacer tous les fichiers html du répertoire
/tmp vers le répertoire /var/www, utilisez la commande

     mv /tmp/*.html /var/www

#### 2.2.3 - Gestion des droits

Sous UNIX, donc en particulier sous linux, tout est fichier. Les
périphériques sont donc accéssibles comme des fichiers. Tout objet de
l'arborescence du système de fichier possède des droits d'accès, les
droits UGO (User, Group, Other).

Linux étant un système multi-utilisateur, il convient de pouvoir
attribuer des droits d'accès au possesseur du fichier (User), au groupe
auquel il appartient (Group) mais aussi au reste du monde (Other). Il
existe trois types de droits : lecture (**r**ead), écriture (**w**rite),
éxécution (e**x**ecute). Si vous remontez plus haut dans ce document,
vous avez déjà apperçu une représentation de ces droits :

    -rw-r--r-- 1 root root 188 2005-10-12 18:29 dbootstrap_settings
    -rw-r--r-- 1 root root 1336 2005-10-12 18:29 install-report.template
    drwxr-xr-x 2 root root 1024 2005-10-12 19:28 temp

Nous savons déjà à quoi correspond le '-' ou le 'd' de la première
colonne. Regardons maintenant de plus près le reste de la ligne. La
première série de trois colonnes correspond aux droits User. Il possède
la lecture et l'écriture du fichier. Le possesseur du fichier est
indiqué par le premier 'root'. Ce dernier étant un fichier texte, le
droit d'execution est inutil, ce n'est pas une commande. La seconde
série correspond aux droits du groupe. Le groupe ne possède que le droit
de lire le fichier. Le groupe est indiqué par le second 'root'. Ensuite
nous trouvons la taille du fichier (en octet) puis ses date et heure de
modification. Une dernière chose sur les droits UGO, pour avoir le droit
de lire le contenu d'un répertoire, il faut lui assigner le droit 'r'
mais pour pouvoir se déplacer dans ce répertoire, il faut lui assigner
le droit 'x'.

Pour changer les droits d'un fichier, il faut être soit root, soit le
possésseur du fichier et utiliser la commande chmod. Une utilisation
intuitive de cette commande consiste à décrire ce que l'on veut faire :

` chmod `<ugo>`<+|->`<rwx>` `<nom fichier>` (le + affecte les droits indiqués par r, w ou x, le - retire ces droits)`

Par exemple pour affecter les droits lecture et execution à la commande
'cmd' pour l'utilisateur et le group, entrez :

     chmod ug+rx cmd

Vous rencontrerez certainement une autre façon d'écrire les droits, la
représentation octale. En effet, le très gros avantage de cette gestion
des droits, c'est qu'elle ne prend pas beaucoup de place. Pour chaque
fichier l'ensemble des droits tient dans 12 bits :

     sss uuu www ooo

Les 3 bits systèmes (les 3 premiers) sont rarement utilisés donc non
abordés ici. Il est donc possible d'utiliser une représentation beaucoup
plus concise : donner le chiffre représenté par bloque de 3 bits. Un
"poids" a été donné à chaque droit: r vaut 4, w vaut 2 et x vaut 1. Pour
calculer la valeur de chaque bloque de 3 bits, il suffit d'additionner
les droits que l'on désire appliquer. Par exemple :

     rw- r-- r-- va aussi s'écrire 644

Ce qui nous donne un paramètre beaucoup plus simple pour chmod.

*les ACL*

### 2.3 Système de packaging

Les outils que vous avez utilisez ou ceux que vous utiliserez
proviennent de package. Certaines distributions utilisent un système de
packaging. Les notres utilisent respectivement le RPM (RedHat Package
Manager) et le DEB (DEBian). Les package s'installent, se désinstallent,
se trouvent à l'aide de commande de gestion de packaging.

#### 2.3.1 Gestion des paquets RedHat

#### 2.3.2 Gestion des paquets Debian

Un paquet Debian s'installe avec la commande

` apt-get install `<nom du paquet>

Pour désinstaller un paquet, entrez simplement la commande :

` apt-get remove `<nom du paquet>

Pour rechercher dans la base de tous les paquets

` apt-cache search `<mots clés>

### 2.4 - Et maintenant ?

A quoi peut bien vous servir ce que vous avez appris jusqu'à présent ?
... Bien qu'un dossier technique sera consacré à chaque outil en détail,
voici une première approche pour utiliser le Linux que vous venez
d'installer...

#### 2.4.1 - Serveur FTP

Il existe moult serveur FTP, nous utiliserons ici proftpd.

##### 2.4.1.1 - Installation

Pour installer proftpd, entrez la commande :

     apt-get install proftpd

pui validez l'opération d'installation en appuyant sur 'y'.

##### 2.4.2.2 - Arrêt/Démarrage

Après l'installation, le serveur ftp démarre par défaut. Il peut-être
arrêté par la commande

     /etc/init.d/proftpd stop

ou démarré avec la commande

     /etc/init.d/proftpd start

##### 2.4.2.3 - Utilisation

Utilisez votre compte administrateur ou votre compte utilisateur et leur
mot de passe respectif pour accéder à votre machine depuis un autre
ordinateur via ftp.

#### 2.4.2 - Serveur WEB

##### 2.4.2.1 - Installation

Pour installer apache, entrez la commande :

     apt-get install apache

puis validez l'opération d'installation en appuyant sur 'y'.

##### 2.4.2.2 - Arrêt/Démarrage

Après l'installation, le serveur web démarre par défaut. Il peut-être
arrêté par la commande

     /etc/init.d/apache stop

ou démarré avec la commande

     /etc/init.d/apache start

##### 2.4.2.3 - Où placer mes fichiers ?

Un serveur WEB étant utilisé pour diffuser un site web, il convient de
placer vos fichier html à l'endroit adéquat. Par défaut, la
configuration d'apache implique que vos fichiers HTML (dont le fichier
index.html : racine du site) soient placé dans le répertoire /var/www.
Transférez vos fichiers HTML via le serveur FTP ou via une disquette.

#### 2.4.3 - Ajouter un utilisateur courant

Afin de faciliter l'utilisation des outils installé, et éviter de
détruire le système suite à une fausse manipulation, les opérations ne
touchant pas à l'administration de base Linux (comme d'ailleur pour tout
système Unix) se fait via des utilistateurs courant, identifié par un
nom d'utilisateur et appartenant à un ou plusieurs groupes (au minimum
un groupe, le groupe par défaut).

##### 2.4.3.1 - Restons groupés !

L'utilisation de groupes permet de d'affiner la sécurité et la gestion
du système. Par exemple, seul les utilisateur membres du groupe "cdrom"
pourront "monter" et "demonter" un disque CD et le lire. Par contre les
membres du groupe "cdwriter" pourront en plus écrire dessus ! Il est
important de connaitre cette notion, mais pas nécessaire de la maîtriser
pour effectuer des opérations de base.

##### 2.4.3.2 - Ajouter l'utilisateur.

Passons aux choses sérieuses : Ajout d'un utilisateur via adduser. cette
commande, entrée à l'invite en tant que root vas nous guider dans la
création d'un utilisateur. L'exemple suivant vas créer pour Monsieur
Frederic oobar un compte utilisateur, avec pour identifiant foobar. un
mot de passe (les \*) lui seras attribué, et aucunes informations autres
que les minimas ne seront donnée au système (pas de numéros de
téléphone, pas d'adresse)

    darkstar-ws:~# adduser
    Enter a username to add: foobar
    Adding user `foobar'...
    Adding new group `foobar' (1004).
    Adding new user `foobar' (1004) with group `foobar'.
    Creating home directory `/home/foobar'.
    Copying files from `/etc/skel'
    Enter new UNIX password:
    Retype new UNIX password:
    passwd: password updated successfully
    Changing the user information for foobar
    Enter the new value, or press ENTER for the default
            Full Name []: Frederic OOBAR
            Room Number []:
            Work Phone []:
            Home Phone []:
            Other []:
    Is the information correct? [y/N] y

Un répertoire lui a été assigné. Son répertoire "home", ainsi qu'un
numéro d'utilisateur et de groupe par défaut (son groupe par défaut est
foobar. En effet, un groupe par user est créer.).

Il est possible de créer le user en tapant simplement :

    adduser foobar

Il ne reste plus à l'utilisateur qu'à s'identifier sur le système.

#### 2.4.4 - Autres outils

L'installation et le démarrage d'autres outils (mysql pour la base de
donnée, bind pour le DNS, ...) fonctionne à l'identique des exemples
donnés ci-dessus. Un dossier technique sera publié pour chaque outils
avec les possibilités et options de chaque.

3 - Utilisation avancée
-----------------------

Ce qui suit s'appuie sur des connaissances de bases acquises dans le
chapitre précédent. En cas de doute ou d'incompréhension, n'hésitez pas
à revenir au chapitre "Utilisation simple".

### 3.1 - Les processus

gestion des processus (fork, thread, file d'attente, load) et de la
communication entre processus (signaux, sémaphore, zone mémoire
partégé) + nice

#### Traitement en tâche de fond

On peut lancer une commande en tâche de fond (le nom de la commande est
suivit par '&') pour pouvoir lancer d'autres commandes depuis le
terminal (sans quoi on ne peut plus lancer aucune commande jusqu'à la
fin de l'exécution de la commande). Attention cependant, cette commande
ne doit doit pas avoir de sortie écran ou attendre d'entrée clavier. Par
exemple, la commande suivante recherche tous les fichiers dont le nom
commence par 'install' :

    find / -type f -name "install*" -print > liste 2> /dev/null &

Cette commande étant assez longue, on peut ainsi continuer à travailler
sur le même terminal. Pour supprimer les sorties écran, on redirige la
sortie standard vers un fichier, et la sortie d'erreur standard vers le
'trou noir' qu'est /dev/null.

Lorsqu'on lance une commande en tâche de fond, deux numéros apparaissent
:

    [1] 7349

qui indiquent les numéros de tâche de fond et de processus. Le numéro de
tâche de fond est celui qui correspond au numéro de processus en action,
qu'il tourne ou non. Le numéro de processus est le même que celui qui
est affiché par la commande ps, et qui sert à forcer l'arrêt d'une
commande grâce à la commande kill :

    7349 pts/0    00:00:00 find / -type f -name install* -print

La commande jobs permet d'afficher les commandes qui s'éxecutent en
arrière plan :

    [1]+  Running                 find / -type f -name "install*" -print >liste 2>/dev/null &

L'option -l permet d'afficher en plus le numéro de processus :

    [1]+  7349 Running                 find / -type f -name "install*" -print >liste 2>/dev/null &

En appuyant sur les touches

    Ctrl+z

on peut stopper l'éxecution d'une commande. Elle se retrouve alors en
arrière plan, comme l'indique le résultat de la commande jobs :

[4]+ Stopped find / -type f -name "install\*" -print \>liste 2\>
/dev/null

On peut relancer la commande en arrière plan avec la commande bg %4, ou
en avant plan avec la commande fg %4. Au lieu du numéro de job, on peut
spécifier le numéro de processus.

Si on veut voir exécuter la commande d'arrière plan en avant plan, il
faut appeller la commande kill avec l'option -STOP pour suspendre le
processus, et avec l'option -CONT pour le relancer (respectivement
kill -STOP %4 et kill -CONT %4).

Si il faut attendre la fin d'un processus particulier avant de reprendre
la main, on peut lancer la commande en tâche de fond, puis invoquer la
commande wait %4. On pourra continuer dès que le processus spécifié sera
terminé.

#### Priorité d'un processus

Chaque processus se voit affecter une priorité qui correspond à un
numéro. Lorsqu'une commande est lancée, le processus a une priorité
maximale. Plus le processus occupe de temps d'éxecution pour le
processeur, plus son numéro de priorité baisse, et moins le processus
occupe de temps d'éxecution pour le processeur, plus son numéro de
priorité augmente. Ainsi, plusieurs processus peuvent être éxecutés en
même temps. La commande nice permet de diminuer la priorité du processus
(pour les commandes longues et peu urgentes, par exemple). Le paramétre
spécifié après l'option -n est un nombre compris entre 0 et 20 qui
indique le facteur de diminution :

    nice -n 20 find / -type f -name "install*" -print > liste 2> /dev/null &

L'administarteur système (compte root) peut également augmenter la
priorité avec un nombre négatif :

    nice -n -20 find / -type f -name "install*" -print > liste 2> /dev/null &

et la commande renice permet de changer le facteur de priorité en cours
d'exécution de la commande, en spécifiant le nouveau facteur de priorité
et le numéro de processus :

    renice 10 7349

Le résultat informe alors le super utilisateur du changement :

    7349: old priority 19, new priority 10

### 3.2 - Le système de fichier

#### 3.2.1 - monter/démonter un système de fichier

La commande mount permet d'attacher un système de fichiers trouvé sur un
périphérique quelconque à l'arborescence des fichiers du système. A
l'inverse umount le détachera à nouveau. La syntaxe de cette commande
est la suivante :

mount -t <type de système de fichier> <nom fichier> <emplacement>

où :

-   Type de système de fichier, décrit le format utilisé par le système
    de fichier à monter. Voir la liste des principaux types ci dessous.
    Si l'option '-t' n'est pas mentionnée, ou si le type 'auto' est
    précisé, la recherche de type est effectuée sur le superblock (dans
    l'ordre : minix, ext, ext2, xia, iso9660 sont supportés). Si cette
    recherche échoue, et si /proc/filesystems existe, alors tous les
    types de systèmes de fichiers listés seront essayés successivement.

Principaux types de systèmes de fichiers supportés par la commande
mount:

  --------- --------------------------------------------------
  Type      Signification
  ext2      Système de fichier standard de Linux
  ext3      Système de fichier journalisé de Linux
  fat       Système de fichier FAT (DOS)
  vfat      Système de fichier FAT32 (depuis Windows 95r2)
  iso9660   Système de fichier des CD-ROM
  ntfs      Système de fichier de Windows NT (lecture seule)
  nfs       Système de fichier réseau (Unix)
  smb       Système de fichier réseau (Windows)
  --------- --------------------------------------------------

-   Nom fichier est le nom du fichier contenant le système de fichier à
    monter. Il s'agit généralement de fichiers du répertoire /dev/. Par
    exemple :

    /dev/hda1 pour la première partition du premier disque dur (le disque A)
    /dev/hdb3 pour la troisième partition du deuxième disque dur (le disque B)
    /dev/fd0 pour le premier lecteur de disquette
    /dev/scd0 pour le premier lecteur de CD-ROM SCSI

-   Emplacement est le répertoire de la hiérarchie des fichiers où sera
    monté le système de fichiers. Le contenu précédent du répertoire
    (s'il n'était pas vide), ainsi que son propriétaire et ses modes
    d'accès initiaux deviennent invisibles tant que le nouveau système
    de fichiers reste monté. Le chemin d'accès du répertoire représente
    alors la racine du système de fichiers se trouvant sur le
    périphérique.

Le fichier /etc/fstab, contient des lignes décrivant les systèmes de
fichiers habituellement montés, leurs répertoires, et leurs options. Ce
fichier est utilisé dans trois buts :

-   Le montage automatique des systèmes de fichiers couramment utilisés.
    La commande mount -a [-t type] (généralement exécutée dans un script
    de démarrage) monte tous les systèmes de fichiers indiqués dans
    fstab (ou uniquement ceux du type indiqué), à l'exception de ceux
    dont la ligne contient le mot-clé 'noauto'.

<!-- -->

-   La simplification du montage des systèmes de fichiers. Lorsque l'on
    monte un système de fichiers mentionné dans la fstab, il suffit
    d'indiquer le point de montage, ou le périphérique (exemple : mount
    /mnt/cdrom pour monter le CD-ROM).

<!-- -->

-   La gestion des droits de montage des systèmes de fichiers.
    Normalement, seul le Super-Utilisateur (root) peut monter des
    systèmes de fichiers. Néanmoins, si la ligne de la fstab contient
    l'option user, n'importe quel utilisateur peut monter le système de
    fichiers correspondant.

Ainsi, avec une ligne :

    /dev/cdrom /cd iso9660 ro,user,noauto,unhide

dans le fichier /etc/fstab, n'importe quel utilisateur peut monter le
système iso9660 se trouvant sur son CDROM en utilisant la commande mount
/dev/cdrom.

Exemple de fichier fstab

    # /etc/fstab: static file system information.
    #
`# `<file system>` `<mount point>`   `<type>`  `<options>`       `<dump>`  `<pass>\
    proc            /proc           proc    defaults        0       0
    /dev/hda4       /               ext3    defaults,errors=remount-ro 0       1
    /dev/hda3       none            swap    sw              0       0
    /dev/hdb        /media/cdrom0   iso9660 ro,user,noauto  0       0
    /dev/sda1       /media/jukebox  vfat rw,user,quiet,umask=0002,iocharset=iso8859-1,codepage=850  0 0

#### 3.2.2 - Les fichiers spéciaux

#### 3.2.3 - Gestion des droits - les ACL

ACL + bits système

### 3.3 Système de packaging

#### 3.3.1 Gestion des paquets RedHat

-   lister les paquets installer
-   lister les fichiers contenues dans chaque paquet
-   forcer l'installation d'un paquet

#### 3.3.2 Gestion des paquets Debian

-   lister les paquets installer
-   lister les fichiers contenues dans chaque paquet
-   forcer l'installation d'un paquet

### La mémoire

La gestion de la mémoire, NUMA (Non-Uniform Memory Access) ou pas.
chargé d'affecter à chaque programme une zone mémoire. Il a également un
rôle de protection : la mémoire pour un processus est privée et celle-ci
ne doit pas être lue ni modifiée par un autre.

### réseau

Une couche réseau de tout premier ordre.

### la hiérarchisation des répertoires

Linux n'étant qu'un noyau, chaque distribution revendiquait la meilleur
des arborécences. Aujourd'hui avec le groupe de travail Linux Standart
Base (lsb) et sa réflexion sur le Filesystem Hierarchy Standard
([FHS](http://www.pathname.com/fhs/)) la hiérarchie des répertoire tend
vers une solution unique.

  Répertoire   Description
  ------------ ----------------------------------------------------------------------------------------------------------------------------------------------
  /bin         les binaires utilisateurs essenciels. Indispensable pour faire fonctionner le système en mode dégradé, utilisable par tous les utilisateurs.
  /boot        les éléments statique du démarrage : image du noyau, images des modules.
  /dev         répertoires qui contients tous les pseudo fichier d'accès au périphérique
  /etc         l'ensemble du paramétrage, de la configuration.
  /media       les points de montage vers les périphérique multimédia amovible (appareil photo, clef usb, lecteur CD, etc.)
  /opt         les applications supplémentaires.
  /sbin        Les binaires de base du système réservé au supper utilisateur.
  /sys         Apparu avec les noyau 2.6, ce sous système de fichier permet de naviguer dans les différents pilote de matériel qui sont chargés.
  /usr         la zone des programmes utilisateurs, c'est là que sont installés les executables de toutes les applications.
  /home        les données des utilisateurs
  /lib         les librairies dynamiques indispensable au système : les modules du noyau, les librairies essentiels.
  /mnt         le point de montage temporaire
  /proc        un système de fichier qui permet d'interagire avec le noyau et les processus
  /root        les données utilisateur du supper utilisateurs
  /srv         les données des services disponible sur la machine
  /tmp         le répertoire temporaire volatile, c'est à dire que les données ne seront pas forcément disponible après un reboot
  /var         les données des programmes à volumétrie variable (fichiers de log, spool)

Autres
------

Le déroulement d'un login avec les fichiers chargés, les fichier vitaux
(/etc/passwd, /etc/hosts, /etc/fstab (en décrivant les différents
niveaux ...), ...)
