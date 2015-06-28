+++
date = "2010-09-27"
draft = false
title = "Notes qemu"
color = "yellow"
icon = "tasks"
Tags = [ "mediawiki"]
description = "Notes qemu"
+++

quelques notes sur la manipulation d'images qemu / xen / kvm / etc.

Monter des partitions d'images :

    losetup /dev/loop0 sys.img
    kpartx -av /dev/loop0
    mount /dev/mapper/loop0p1 /mnt/
    chroot /mnt/
    
    umount /mnt
    kpartx -d /dev/loop0
    losetup -d /dev/loop0
