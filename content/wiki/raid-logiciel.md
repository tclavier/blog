+++
date = "2008-12-20"
draft = false
title = "Raid logiciel"
color = "amber"
icon = "plus-circle"
Tags = [ "mediawiki"]
description = "Raid logiciel"
+++

Quelques petites procédures courante avec mdadm sous linux

Changement de disque
--------------------

    sfdisk -d /dev/sda | sfdisk /dev/sdb
    mdadm /dev/md0 --add /dev/sdb1
