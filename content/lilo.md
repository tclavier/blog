Title:Lilo
Date:2009-10-05
Tags: trucs et astuces,  mediawiki

faire l'équivalent du fixmbr windosien depuis linux:

`lilo -M /dev/hda mbr `

après avoir vérifié que c'est bien la partition windows qui a le drapeau
de boot actif (cf fdisk).

