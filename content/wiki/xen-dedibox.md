+++
date = "2008-06-21"
draft = false
title = "Xen dedibox"
color = "deep-orange"
icon = "refresh"
Tags = ["trucs et astuces","linux", "mediawiki"]
description = "Xen dedibox"
+++

quelques notes sur l'utilisation de l'hyperviseur Xen sur une dedibox
avec une debian etch. Pour l'installation sur une dedibox v2 voir [Xen
dedibox2](/wiki/xen-dedibox-v3)

### Debian Etch

Installer une debian etch avec juste un / de 2G, l'espace restant sera
utilisé par le LVM

Installer les paquets Xen :

     apt-get install xen-linux-system-2.6.18-4-xen-686 xen-tools libc6-xen \
     xen-hypervisor-3.0.3-1-i386-pae xen-linux-system-2.6.18-4-xen-vserver-686 bridge-utils

voilà, il est temps de rebooter. Une fois le reboot effectif, vous
pouvez vérifier que vous utilisez bien le noyau xen :

     uname -a 
     Linux dedi01 2.6.18-4-xen-686 #1 SMP Mon Mar 26 21:49:04 UTC 2007 i686 GNU/Linux

Pour jouer avec les lvm et reiserfs, il faut les installer :

     apt-get install lvm2 reiserfsprogs

Un petit fdisk plus tard, il est possible de créer un VG (vg00) avec
tout le disque restant.

Une des fonctionnalités de xen c'est d'utiliser un pont réseau pour
regrouper toutes les interfaces virtuelles. Dans mon cas, je vais avoir
quelques machines virtuelles avec des IPs privés, et peut-être une ou 2
avec des IPs publiques supplémentaires. Il me faut donc 2 ponts réseau.

Configurons donc ces ponts réseau :

     vi /etc/network/interfaces
     auto dummy0
     iface dummy0 inet static
           address 192.168.1.1
           netmask 255.255.255.0

### Dom0

ajouter un wrapper pour le script bridge :

     vi /etc/xen/scripts/network-bridge-dedi

    #!/bin/sh
    # Exit if anything goes wrong.
    set -e

    # First arg is the operation.
    OP=$1
    shift

    script=/etc/xen/scripts/network-bridge

    case ${OP} in
       start)
            $script start bridge=xennet netdev=eth0 vifnum=0 antispoof=no
            $script start bridge=xendmz netdev=dummy0 vifnum=1 antispoof=no
            ;;

       stop)
            $script stop bridge=xennet netdev=eth0 vifnum=0
            $script stop bridge=xendmz netdev=dummy0 vifnum=1
            ;;

       *)
           echo 'Unknown command: ' ${OP}
           echo 'Valid commands are: start, stop'
           exit 1
    esac

     chmod +x /etc/xen/scripts/network-bridge-dedi

configurer xen pour utiliser un pont réseau :

     vi /etc/xen/xend-config.sxp
     (network-script network-bridge-dedi)
     #(network-script network-dummy)
     /etc/init.d/xend restart

pour vérifier que tout marche bien, on affiche l'état des ponts :

     brctl show
     bridge name     bridge id               STP enabled     interfaces
     xendmz          8000.feffffffffff       no              vif0.1
                                                             pdummy0
     xennet          8000.feffffffffff       no              vif0.0
                                                             peth0

on ajoute un peut de nat :

     /sbin/iptables -t nat -A POSTROUTING -o xennet -j MASQUERADE

Reste à configurer une petite machine virtuelle :

     vi /etc/xen-tools/xen-tools.conf
     xen-create-image --hostname=mail --size=4Gb --swap=256Mb --ip=192.168.1.2 --lvm=vg00 --debootstrap --dist=etch  --passwd

Un petit lvscan permet de voir les 2 nouveaux FS :

    dedi01:/etc/xen# lvscan
      ACTIVE            '/dev/vg00/mail-disk' [4,00 GB] inherit
      ACTIVE            '/dev/vg00/mail-swap' [256,00 MB] inherit

changer le fichier de conf pour bien utiliser le bon pont :

     vi /etc/xen/mail.cfg
     vif  = [ 'ip=192.168.1.2' 'bridge=xendmz']

et on peut booter la nouvelle machine, et se connecter dessus :

     xm create /etc/xen/mail.cfg
     xm console mail

pour la lancer automatiquement :

     cd /etc/xen/auto
     ln -s ../mail.cfg .

### Contournement d'un bug dans l'allocation mémoire du pilote réseau

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

### Mon utilisation

Depuis la mise en ligne de ces quelques notes vous êtes nombreux à me
demander comment j'utilise mes xen, alors voilà , j'ai 7 domU sur ma
dedibox réparties comme ceci :

-   divers, 64Mo de ram pour le ldap
-   greg, 128Mo de ram serveur web d'un amis
-   jabber, 128Mo de ram serveur jabber (ejabberd) avec les passerelles
-   lmbc, 128Mo de ram le site web de lille métropole basket club (LAMP)
-   mail, 96Mo de ram, serveur de mail exim + spamassassin + imap
-   walcky, 128Mo de ram, lamp + smtp + spamassassin + imap
-   web, 192Mo de ram front web apache + divers sites php + mysql.

Vous pouvez consulter les [Statistiques](/wiki/statistiques) de
toutes ces machines.

### Liens

-   <http://www.punknix.com/?q=virtualization_xen>
-   <http://www.howtoforge.com/perfect_setup_xen3_debian_p6>

