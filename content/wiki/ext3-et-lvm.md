+++
date = "2008-05-26"
draft = false
title = "Ext3 et LVM"
color = "deep-purple"
icon = "camera-retro"
Tags = [ "mediawiki"]
description = "Ext3 et LVM"
+++

depuis l'intégration d'un patch fedora alias red-hat les outils
ext2resize permettent de retailler à chaud une partition ext3 ... que du
bonheur pour les serveurs en ext3 avec lvm:

    apt-get install ext2resize

puis

    lvresize -L +1G /dev/vg00/lv00
    ext2online /dev/vg00/lv00

et voilà une partition agrandit juste pour les besoins
