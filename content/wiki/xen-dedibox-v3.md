+++
date = "2011-01-10"
draft = false
title = "Xen dedibox v3"
color = "green"
icon = "bomb"
Tags = ["trucs et astuces","linux", "mediawiki"]
description = "Xen dedibox v3"
+++

Dedibox à sortir la [version 3 des
dedibox](http://www.online.net/serveur-dedie/offre-dedibox-v3.xhtml) ...
je m'empresse donc de mettre à jour cette petite page

L'objectif de ce document c'est de décrire l'installation de xen sur une
dedibox V3 à 15€ HT par mois. Le dom0 sera sur une petite partition de
3G en début de disque et tout le reste sera en lvm avec reiserfs. Pas de
debian sqeeze pour cause de bug dans la quadrilogie udev / kernel 2.6.32
/ xen 4 / domU.

Dom0
----

### Dedian Lenny

Installer une debian Lenny 64 (debian 5.0) avec juste un / de 3G et un
petit swap, l'espace restant sera utilisé par le LVM. Ne pas oublier de
changer les mots de passes.

Installer les paquets Xen :

    apt-get install xen-hypervisor-3.2-1-amd64 xen-utils-3.2-1 linux-image-xen-amd64 xen-tools

Un petit fdisk pour créer un sda3 sur tout le disque restant et voilà,
il est temps de rebooter. Une fois le reboot effectif, vous pouvez
vérifier que vous utilisez bien le noyau xen :

    uname -a 
    Linux dedi04 2.6.26-2-xen-amd64 #1 SMP Thu Sep 16 16:32:15 UTC 2010 x86_64 GNU/Linux

Pour jouer avec les lvm et reiserfs, il faut les installer :

     apt-get install lvm2 reiserfsprogs

Il est possible de créer un VG (vg00 par exemple) avec tout le disque
restant.

     pvcreate /dev/hda3
     vgcreate vg00 /dev/hda3

### Du routage en ipv4

modifier le fichier /etc/xen/xend-config.sxp

    (network-script network-route)
    (vif-script     vif-route)

et ajouter ces 3 lignes dans le fichier /etc/sysctl.conf

    net.ipv4.ip_forward=1
    net.ipv4.conf.all.proxy_arp=1
    net.ipv4.conf.default.proxy_arp=1

### Un routeur IPv6

Installer les bon paquets

     apt-get install iproute radvd

Trouver son préfix 6to4, la commande suivante devrait fonctionner :

     printf "2002:%x%02x:%x%02x::\n" $(ifconfig eth0 | grep "inet adr"| sed -e 's/.*adr://' -e 's/B.*//g' -e 's/\./ /g')
     2002:58bf:503b::

Pour l'instant ça ne fonctionne pas.

DomU
----

Reste à configurer une petite machine virtuelle :

    vi /etc/xen-tools/xen-tools.conf
    IP=mon_adresse_ip_redondante
    GW=addresse_ip_machine_hote
    NAME=test2
    xen-create-image --hostname=$NAME --ip=$IP --gateway=$GW --netmask=255.255.255.255 --lvm=vg00

Un petit lvscan permet de voir les 2 nouveaux FS :

    dedi02:/etc/xen# lvscan
      ACTIVE            '/dev/vg00/test2-disk' [36,00 GiB] inherit
      ACTIVE            '/dev/vg00/test2-swap' [1,00 GiB] inherit

config dans le domU

    mount /dev/vg00/$NAME-disk /mnt
    vi /mnt/etc/network/interfaces

    auto eth0
    iface eth0 inet static 
      address mon_adresse_ip_redondante
      netmask 255.255.255.255
      post-up /sbin/route add -net ADDR_IP_MACHINE_HOTE netmask 255.255.255.255 eth0
      post-up /sbin/route add default gw ADDR_IP_MACHINE_HOTE

    umount /mnt

et on peut booter la nouvelle machine, et se connecter dessus :

     xm create /etc/xen/$NAME.cfg
     xm console $NAME

pour la lancer automatiquement :

     cd /etc/xen/auto
     ln -s ../$NAME.cfg .

Récupération de DomU
--------------------

Tous les domU étaient à reprendre de l'ancienne dedibox ... j'ai donc
changé les machine virtuelle de machine physique, en un mot migré d'une
machine à l'autre.

On copie les lv de la machine1 vers la machine2 grace au snapshot lvm.
Sur machine1 on crée le snapshot

    DOMU=domu
    lvcreate -s  -n ${DOMU}-disk-snapshot -L 150M /dev/vg00/${DOMU}-disk
    mount /dev/vg00/${DOMU}-disk-snapshot /mnt/

Sur machine2 on crée un lv de la même taille

    DOMU=domu
    lvcreate -n ${DOMU}-disk -L 15G vg00
    mkreiserfs /dev/vg00/${DOMU}-disk
    mount /dev/vg00/${DOMU}-disk /mnt/

Et on copie les données :

    rsync -a --progress --numeric-ids machine1:/mnt /

Sur machine1 on stop le domU et on synchronise le lv

    xm shutdown ${DOMU}
    umount /mnt
    mount /dev/vg00/{$DOMU}-disk /mnt/

Sur machine2 on crée le lv de swap et on synchronise les dernières
données

    lvcreate -n ${DOMU}-swap -L 256M vg00
    
    rsync -a --progress --numeric-ids machine1:/mnt /
    umount /mnt
    scp machine1:/etc/xen/${DOMU}.cfg /etc/xen/

Et voilà, on peut maintenant lancer \${DOMU} sur la nouvelle machine

Autre
-----

### Contournement d'un bug Xen 3 dans l'allocation mémoire du pilote réseau

Régulièrement, certains domU se retrouvais injoignable par le réseau,
des ping dom0 vers domU et domU vers dom0 donnaient 100% des paquets
perdu pourtant toutes les interfaces étaient là, bien présentent, et
bien configuré. Seul indice, cette ligne dans /var/log/message

    xen_net: Memory squeeze in netback driver.

La solution, fixer la mémoire utilisé par dom0, dans
/etc/xen/xend-config.sxp

    (dom0-min-mem 96)

et dans /boot/grub/menu.lst

    # xenhopt=dom0_mem=96M

### bug Xen 4 et noyau 2.6.32

Les symptomes sont les suivants : pas de log, ping du domU passe plus et
depuis le domU (xm console) ping dom0 passe pas. Seul solution relance
le domU. D'après mes recherches il y a un bug dans la suite udev \>
125 + xen 4 + noyau 2.6.32 utilisé en domU. Pas de solution pour
l'instant et j'ai pas rassemblé suffisamment d'éléments pour faire un
bug ;-(

### Système de secours

En cas de problème dedibox met à disposition un "Système de secours" la
dedibox boot en pxe avec une ubuntu. Pour éviter le problème lié au
"StrictHostKeyChecking" je propose la solution suivante.

    ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no user@IP

pour monter le disque et faire une cage :-)

    mount /dev/sda2 /mnt
    mount --bind /dev /mnt/dev
    mount --bind /sys /mnt/sys
    mount --bind /proc /mnt/proc
    chroot /mnt

    umount /mnt/dev
    umount /mnt/sys
    umount /mnt/proc
    umount /mnt

### Mon utilisation

Depuis la mise en ligne de ces quelques notes vous êtes nombreux à me
demander comment j'utilise mes xen, alors voilà, nous sommes 4 sur une
dedibox avec 4 VM de 34G de DD et 448M de ram.

### Liens

-   <http://www.punknix.com/?q=virtualization_xen>
-   <http://www.howtoforge.com/perfect_setup_xen3_debian_p6>
-   [Cacti xen](/wiki/cacti-xen)

Trucs en plus
-------------

Supprimer un noyau bloquant

    apt-get remove linux-image-2.6.32-bpo.4-686-bigmem
    mv /etc/grub.d/10_linux /etc/grub.d/50_linux
    update-grub2
    grub-install /dev/sda
