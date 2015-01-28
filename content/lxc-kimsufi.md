Title:Lxc kimsufi
Date:2011-06-22
Tags:  mediawiki

Quelques notes sur la création de containers linux (lxc) sur un serveur
[kimsufi](http://kimsufi.com) ça marche aussi très bien avec les dedibox

Controling Host
===============

Quelques paquets
----------------

Le "controling host" en lxc est en quelques sorte l'hyperviseur de xen,
kvm ou vmware.

Installer une debian 64 (debian 6.0 en ce moment) avec juste un / de 3G
et un petit swap, l'espace restant sera utilisé par le LVM. Ne pas
oublier de changer les mots de passes. Installer lxc, lvm et reiserfs :

` apt-get install lxc lvm2 reiserfsprogs bridge-utils debootstrap`

migrer vers une version de noyau standard de debian

`apt-get install linux-image-amd64`\
`rm -rf /boot/bzImage-2.6.38.2-xxxx-grs-ipv6-64 /boot/System.map-2.6.38.2-xxxx-grs-ipv6-64 /etc/grub.d/06_OVHkernel`

Préparation du disque restant

` fdisk /dev/sda`

Montage cgroup

`echo "cgroup          /cgroup         cgroup  defaults        0       0" >>  /etc/fstab`\
`mkdir -p /cgroup`

Reboot pour prise en compte de la partition et du nouveau noyau

` reboot`

Il est possible de créer un VG (vg00 par exemple) avec tout le disque
restant.

` pvcreate /dev/sda3`\
` vgcreate vg00 /dev/sda3`

Du réseau IPV4
--------------

Ajout d'un bridge pour remplacer eth0

`sed -i -e 's/eth0/br0/g' /etc/network/interfaces`

puis vi /etc/network/interfaces pour ajouter les lignes suivante dans la
conf de br0

`  bridge_ports eth0`\
`  bridge_stp off`\
`  bridge_maxwait 5`\
`  bridge_fd 0`

Des VM
======

Une première VM
---------------

`VM=vm01`\
`MAC=xx:xx:xx:xx:xx:xx`\
`IP=xxx.xxx.xxx.xxx`\
`mkdir -p /var/lib/lxc/$VM`\
`lvcreate -L 4G -n $VM vg00`\
`mkreiserfs /dev/vg00/$VM`\
`echo "/dev/mapper/vg00-$VM   /var/lib/lxc/$VM       reiserfs        defaults        0       2" >> /etc/fstab`\
`mount -a`\
`/usr/lib/lxc/templates/lxc-debian -p /var/lib/lxc/$VM`

config réseau coté controleur

    cat <<EOF >> /var/lib/lxc/$VM/config
    # Config réseau
    lxc.utsname = $VM
    lxc.network.type = veth
    lxc.network.flags = up
    lxc.network.link = br0
    lxc.network.name = eth0
    lxc.network.ipv4 = $IP
    lxc.network.veth.pair = veth$VM
    lxc.network.hwaddr = $MAC   
    EOF

config réseau coté vm

    GW=$(hostname -i | sed -e 's/\([^.]*$\)/254/g')
    cat <<EOF > /var/lib/lxc/$VM/rootfs/etc/network/interfaces
    auto lo
    iface lo inet loopback

    auto eth0
    iface eth0 inet static
        address $IP
        netmask 255.255.255.255
        broadcast $IP
        post-up route add $GW dev eth0
        post-up route add default gw $GW
        post-down route del $GW dev eth0
        post-down route del default gw $GW
    EOF

Changer le mot de passe root

`pwgen`\
`chroot /var/lib/lxc/$VM/rootfs/ passwd`

et on lance la vm

`lxc-start -n $VM -d`

Liens
-----

-   <http://wiki.debian.org/LXC>
-   <http://lxc.teegra.net/#_setup_of_the_controlling_host>
-   <http://nigel.mcnie.name/blog/a-five-minute-guide-to-linux-containers-for-debian>
-   <http://www.delloye.org/linux/lxc.html>

