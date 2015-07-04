+++
date = "2009-09-14"
draft = false
title = "Mémo lvm"
color = "cyan"
icon = "instagram"
Tags = [ "mediawiki"]
description = "Mémo lvm"
+++

En vrac les commandes lvm que j'utilise le plus souvent, j'utilise
systématiquement reiserfs pour sa capacité à gérer de petits fichiers et
l'agrandissement à chaud.

-   agrandir un lv :

     lvresize -L +1G /dev/vg/lv
     resize_reiserfs /dev/vg/lv
     resize2fs  /dev/vg/lv

-   enlever le pv /dev/sdc d'un vg

     pvmove /dev/sdc
     vgreduce vg00 /dev/sdc

-   réduire un lv

     umount /point/de/montage
     resize_reiserfs -s -1G /dev/vg/lv
     lvreduce -L -1G /dev/vg/lv
     mount /point/de/montage

-   autres commandes

     pvscan
     lvscan
     vgscan
