Title:Mémo raw img
Date:2011-11-14
Tags:  mediawiki

mémo sur les images raw de VM (qemu, xen, virtualbox, etc.)

Convertir du qcow2 en raw :

`qemu-img convert -f qcow2 vm-img.qcow2 -O raw vm-img.raw`

Agrandir l'image à 4go (cf seek plus grand que le fichier d'origine):

`dd if=/dev/zero of=vm-img.raw bs=1G count=0 seek=4`

ou passer par un fichier vide :

`dd if=/dev/zero of=null.raw bs=1M count=0 seek=4096`\
`cat null.raw >> vm-img.raw`

retailler le fs (cas xen : 1 fs par fichier)

`resize2fs -f vm-img.raw`

retailler chaque FS dans la VM si le fichier est une image de disque
complet (fdisk + resize2fs)

