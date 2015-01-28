Title:Raid logiciel
Date:2008-12-20
Tags:  mediawiki

Quelques petites procédures courante avec mdadm sous linux

Changement de disque
--------------------

`sfdisk -d /dev/sda | sfdisk /dev/sdb`\
`mdadm /dev/md0 --add /dev/sdb1`

