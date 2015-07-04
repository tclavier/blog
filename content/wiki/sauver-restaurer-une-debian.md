+++
date = "2010-12-08"
draft = false
title = "Sauver restaurer une debian"
color = "red"
icon = "unsorted"
Tags = ["linux", "mediawiki"]
description = "Sauver restaurer une debian"
+++

Cet article est une sorte de mémo pour facilement sauver et donc
restaurer une debian, et ça fonctionne aussi très bien pour une ubuntu.
Très utile dans le cadre d'un changement de machine. En effet, il est
facile de copier la machine source sur la machine cible.

Pour ne pas cumuler les sources de problèmes je conseil vivement de ne
pas faire au passage un changement de version.

Sauver
------

Sur l'ancienne Debian, la machine source, il faut sauvegarder un certain
nombre de dossier :\
\* /etc : pour sauver la configuration de la machine **exclure** :

-   -   /etc/fstab : Si les disques changent
    -   /etc/network/interface : Si les cartes réseau changent
    -   /etc/lvm : Si la configuration lvm à changé
    -   /etc/lilo.conf : si des éléments touchant au bootloader ont
        changé (disques, partitions, etc.)
-   /var : pour sauver les fichiers de travail des démons mais
    **exclure** :
    -   /var/lib/dpkg : dpkg sera réinstallé
    -   /var/lib/apt : apt sera réinstallé
    -   /var/cache/apt : apt sera réinstallé
    -   /var/backups : les backups automatique debian
    -   /var/lib/aptitude : aptitude sera réinstallé
    -   /var/run : les pid des processus en cours
-   /home : pour les données utilisateurs
-   /usr/local : pour sauver ce qui a été installé à la main
-   /root : pour les données root

Comme pour toutes sauvegarde, il faut faire attention aux fichiers en
cours d'utilisation. La solution la plus simple est de stopper tous les
démons avant de la réaliser.

Pour sauver la liste des paquets installés, il existe 2 solutions qui
dépendent des outils que vous utilisez. Si c'est apt :

     dpkg --get-selections > selections.txt

Si c'est aptitude :

     aptitude search -F%p ~i\!~M > selections.txt

Voilà, maintenant que le backup est près, nous allons pouvoir remonter
la machine.

Transférer
----------

Pour garder les droits des fichiers, les données de l'ancienne debian
vers la nouvelle, peuvent être transférées en utilisant ssh et tar.

Pour chaque répertoire, on va écrire sur le nouveau serveur une commande
de ce type:

     cd /
     ssh ancien_serveur "cd /; tar -czvf - rep/à/déplacer " | tar -xzvf -

    ssh root@ancien_serveur "cd /; tar -czvf - /etc --exclude=/etc/fstab --exclude=/etc/network/interface \
    --exclude=/etc/lvm" | tar -xzvf -
    ssh root@ancien_serveur "cd /; tar -czvf - /var --exclude=/var/lib/dpkg --exclude=/var/lib/apt \
    --exclude=/var/cache/apt --exclude=/var/backups --exclude=/var/lib/aptitude --exclude=/var/run" | tar -xzvf -
    ssh root@ancien_serveur "cd /; tar -czvf - /root " | tar -xzvf -
    ssh root@ancien_serveur "cd /; tar -czvf - /usr/local " | tar -xzvf -
    ssh root@ancien_serveur "cd /; tar -czvf - /home" | tar -xzvf -

Restaurer
---------

La restauration va se passer en 4 temps,

-   installation d'une debian minimale
-   réinstallation des paquets (s'il demande de configurer les services
    : vous mettez les options par défaut)
-   restauration de la configuration et des données
-   réinstallation des paquets

J'attire votre attention sur les points suivant

-   le fichier /etc/fstab est peut-être à modifier, si vous avez par
    exemple changé la disposition des disques
-   les fichiers de configurations du boot loader ne sont normalement
    pas à restaurer, si c'est lilo, /etc/lilo.conf est donc à traiter à
    part.
-   /etc/lvm ne doit probablement pas être restauré, tout a été
    normalement créé à l'installation.
-   si la machine change de nom, il ne faudra pas restaurer le fichier
    /etc/hostname, dans ce même cas, je vous conseille aussi de faire un
    *grep -R ancien\_nom /sauvegarde/etc* et de traiter au cas par cas
    toutes les entrées

Pour réinstaller les paquets, encore 2 technique, avec apt :

    dpkg --set-selections < selections.txt
    apt-get update
    apt-get dselect-upgrade
    apt-get dist-upgrade

avec aptitude :

` `<liste-paquets.txt xargs aptitude install

Pour copier les fichiers (et garder les droits) :
<pre>

cp –ra /dossier/de/sauvegarde/\* /

</pre>
dans le cas où le serveur n'est pas mis en production tout de suite
(juste avant sa mise en production, on récupère incrémentalement les
changements qu'il y a pu avoir) :

    rsync -avz root@machine_destination:/var/lib /var/ --exclude ....

voilà la migration de machine est terminé.

Réplication
-----------

La même chose en quelques lignes de shell pour répliquer une machine :-)
old.example.tld étant l'ancienne machine et new.example.tld une machine
fraîchement installé.


    OLD=old.example.tld
    RSYNC_OPT="--progress" 

    rsync -a $RSYNC_OPT $OLD:/root /
    apt-get update
    apt-get dist-upgrade
    ssh $OLD dpkg --get-selections | dpkg --set-selections
    apt-get dselect-upgrade
    apt-get dist-upgrade
    rsync -a $RSYNC_OPT --exclude=/etc/hostname --exclude=/etc/fstab --exclude=/etc/network/interfaces \
          --exclude=/etc/lvm \
          $OLD:/etc /
    rsync -a $RSYNC_OPT --exclude=/var/lib/dpkg --exclude=/var/lib/apt --exclude=/var/cache/apt \
          --exclude=/var/backups --exclude=/var/lib/aptitude --exclude=/var/run \
          $OLD:/var /
    rsync -a $RSYNC_OPT $OLD:/home /
    rsync -a $RSYNC_OPT $OLD:/usr/local /usr/
    apt-get update
    apt-get dist-upgrade
    grep -R $OLD /etc/

Problème connue
---------------

En cas de hook configuré pour apt (visible dans /etc/apt/apt.conf.d/)
une fois /etc de synchronisé tout casse.
