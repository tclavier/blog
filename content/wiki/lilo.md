+++
date = "2009-10-05"
draft = false
title = "Lilo"
color = "amber"
icon = "magnet"
Tags = ["trucs et astuces", "mediawiki"]
description = "Lilo"
+++

faire l'équivalent du fixmbr windosien depuis linux:

    lilo -M /dev/hda mbr 

après avoir vérifié que c'est bien la partition windows qui a le drapeau
de boot actif (cf fdisk).
