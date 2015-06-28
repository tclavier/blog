+++
date = "2009-11-16"
draft = false
title = "Kvm dedibox pro"
color = "blue"
icon = "user-secret"
Tags = [ "mediawiki"]
description = "Kvm dedibox pro"
+++

Après avoir joué à titre perso avec Xen et des [dedibox
v2](/wiki/xen-dedibox-v3), après avoir trituré du Xen sur des
[dédibox pro](/wiki/xen-dedibox-pro) me voilà nez à nez avec une
[dédibox
pro](http://www.dedibox.fr/dedibox-pro/serveur_dedibox_pro.html) à
virtualiser ... Cette fois ci pas de Xen mais du KVM

Machine hote
============

Debian Lenny
------------

Oui je sais je ne met que des debian sur mes serveurs.

Installer une debian lenny 64 (debian 5.0) avec juste un / de 3G,
l'espace restant sera utilisé par le LVM. Ne pas oublier de changer les
mots de passes.

Une petite mise à jour, pour la forme

    apt-get update
    apt-get dist-upgrade

KVM
---

    apt-get install kvm linux-image-amd64 libvirt-bin

il est possible d'utiliser virt-manager pour ne pas avoir à tout gérer
en ligne de commande
