Title:Tgz2vdi
Date:2009-11-09
Tags:  mediawiki

Le besoins est le suivant : après avoir fait un backup depuis un
snapshot lvm d'un domU xen, l'objectif est de relancer l'image de ce
domU dans un virtualBox ... On va convertir une archive tgz en image
disque vdi en passant par du raw :-)

Attention, pour l'instant la procédure n'est pas générique elle ne
fonctionne qu'avec debian, enfin avec les tgz de machine fonctionnant
sous debian.

Snapshot du Xen
---------------

Le domU utilise des disque en lvm

`lvcreate -s -L 1G -n machine-snapshot /dev/vg00/machine-disk`\
`mount -o ro /dev/vg00/machine-snapshot /mnt`\
`cd /mnt/`\
`tar -czvf /tmp/machine-snapshot.tgz .`\
`cd /`\
`umount /mnt`\
`lvremove /dev/vg00/machine-snapshot`

Qemu
----

Création d'un disque au format raw

`qemu-img create -f raw file.raw 3G`

installation d'une debian minimal

`qemu -cdrom debian-503-i386-netinst.iso -hda file.raw -boot d`

trouver la taille des blocs et le premier secteur :

`fdisk -lu file.raw `

    You must set cylinders.
    You can do this from the extra functions menu.

    Disk file.raw: 0 MB, 0 bytes
    255 heads, 63 sectors/track, 0 cylinders, total 0 sectors
    Units = sectors of 1 * 512 = 512 bytes
    Disk identifier: 0xdb7b5e6b

       Device Boot      Start         End      Blocks   Id  System
    file.raw1              63     6281414     3140676   83  Linux

ici 512 et 63, ce qui nous fait un offset de 63 \* 512

Récupération du tgz
-------------------

Montage et copie des données

`mount -o loop,offset=$((63 * 512)) file.raw /mnt -t ext3`\
`cd /mnt`\
`tar --numeric-owner -xzvf /tmp/machine-snapshot.tgz`\
`cd /tmp`\
`umount /mnt`

Tester avec

`qemu -hda file.raw`

VirtualBox
----------

convertion de l'image raw au format vdi

`vboxmanage  convertfromraw file.raw file.vdi`

Attention
---------

Si la machine de départ à une IP en dure, il faut bien évidemment changé
cette conf pour pouvoir la relancer

Liens
-----

<http://blog.jardinmagique.info/2008/04/debian-migration-xen-vers-kvm.html>

