+++
date = "2008-02-14"
draft = false
title = "Rétroportage d'un noyau xen sous debian"
color = "indigo"
icon = "chain"
Tags = [ "mediawiki"]
description = "Rétroportage d'un noyau xen sous debian"
+++

voici un mémo pour refaire un noyau xen spéciale dedibox compilé pour
etch alors que ma station de travail est sous dedian testing.

installation d'une etch

    sudo debootstrap etch etch

copier le fichier de conf du noyau xen stable dans le /tmp de la cage
puis entrer dans la cage

    cp /boot/config-2.6.18-5-xen-686 etch/tmp/
    sudo chroot etch

on installes les locales pour éviter les insultes perl

    apt-get install locales
    dpkg-reconfigure locales

on modifie un peut les sources :

    cat /etc/apt/sources.list
`deb `[`http://ftp.fr.debian.org/debian`](http://ftp.fr.debian.org/debian)` etch main contrib non-free`\
`deb `[`http://ftp.fr.debian.org/debian`](http://ftp.fr.debian.org/debian)` sid main contrib non-free`\
    
    cat /etc/apt/apt.conf
[`APT::Default-Release`](APT::Default-Release)` "stable";`

    apt-get update

on install les sources et de quoi les compiler

    cd /usr/src/
    apt-get install build-essential fakeroot kernel-package libncurses5-dev devscripts
    apt-get build-dep linux-2.6
    apt-get install linux-source-2.6.24
    tar xjf linux-source-2.6.24.tar.bz2
    cd linux-source-2.6.24

Configurer la bête

    cp /tmp/config-2.6.18-5-xen-686 .config
    make menuconfig

à partir de là ça merde Compilier la bête

    make-kpkg clean

-   <http://kernel-handbook.alioth.debian.org/ch-common-tasks.html#s-common-official>
-   <http://kernel-handbook.alioth.debian.org/ch-common-tasks.html#s-common-building>
-   <http://wiki.debian.org/DebianKernelCustomCompilation>

