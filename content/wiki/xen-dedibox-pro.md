+++
date = "2010-05-26"
draft = false
title = "Xen dedibox pro"
color = "pink"
icon = "chevron-up"
Tags = [ "mediawiki"]
description = "Xen dedibox pro"
+++

Après avoir joué à titre perso avec Xen et des [dedibox
v2](/wiki/xen-dedibox-v3) me voilà nez à nez avec une [dedibox
pro](http://www.dedibox.fr/dedibox-pro/serveur_dedibox_pro.html) à
virtualiser ... Mais cette fois ci pas de machine en ip-privé tous les
domU sont en ip publique.

Dom0
====

Debian Lenny
------------

Oui je sais je ne met que des debian sur mes serveurs.

Installer une debian lenny 32 (debian 5.0) avec juste un / de 3G,
l'espace restant sera utilisé par le LVM. Ne pas oublier de changer les
mots de passes.

Une petite mise à jour, pour la forme

    apt-get update
    apt-get dist-upgrade

Installer les paquets Xen :

    apt-get install xen-linux-system-2.6.26-1-xen-686 xen-tools bridge-utils xen-hypervisor-i386-pae

Un petit fdisk pour créer un sda2 et un sdb2 sur les 2 disques (type fd)

    fdisk /dev/sda
    fdisk /dev/sdb

et voilà, il est temps de rebooter. Une fois le reboot effectif, vous
pouvez vérifier que vous utilisez bien le noyau xen :

     uname -a 
     Linux mauricette 2.6.26-1-xen-686 #1 SMP Thu Oct 9 19:59:46 UTC 2008 i686 GNU/Linux

Il faut aussi créer le /dev/md1

     mdadm --create /dev/md1 --level=1 --raid-devices=2 /dev/sda2 /dev/sdb2

Pour jouer avec les lvm et reiserfs, il faut les installer :

    apt-get install lvm2 reiserfsprogs

Il est possible de créer un VG (vg00 par exemple) avec tout le disque
restant.

    pvcreate /dev/md1
    vgcreate vg00 /dev/md1

Du routage en ipv4
------------------

modifier le fichier /etc/xen/xend-config.sxp

    (network-script network-route)
    (vif-script     vif-route)

et ajouter ces 2 lignes dans le fichier /etc/sysctl.conf

    net.ipv4.ip_forward=1
    net.ipv4.conf.all.proxy_arp=1
    net.ipv4.conf.default.proxy_arp=1

DomU
====

Je vous invites à lire [Xen dedibox2](/wiki/xen-dedibox-v3) pour la
création des domU

Routage encore
--------------

config dans le domU (vi /etc/network/interfaces)

    auto eth0
    iface eth0 inet static 
      address mon_adresse_ip_redondante
      netmask 255.255.255.255
      post-up /sbin/route add -net ADDR_IP_MACHINE_HOTE netmask 255.255.255.255 eth0
      post-up /sbin/route add default gw ADDR_IP_MACHINE_HOTE

Quelques petites erreurs
------------------------

voici 2 petits soucis rencontrés

### ssh domU ... stdin: is not a tty

ou ssh domU ... "PTY allocation request failed on channel 0"

dans les 2 cas un petit chroot dans le disque du domU et

    apt-get install udev

### boot qui bloque

un petit chroot dans le disque du domU et vi /etc/fstab ... les
xen-tools ont ajouté une mauvaise option de montage pour un / en
reiserfs changer la ligne :

    /dev/sda2 / reiserfs errors=remount-ro 0 1

par

    /dev/sda2 / reiserfs defaults 0 1
