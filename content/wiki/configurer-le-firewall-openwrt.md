+++
date = "2010-04-29"
draft = false
title = "Configurer le firewall openwrt"
color = "red"
icon = "file-archive-o"
Tags = ["trucs_et_astuces", "mediawiki"]
description = "Configurer le firewall openwrt"
+++

pour activer le net sur le wifi quand le bridge est cassé, ajouter ces 2
lignes dans /etc/firewall.user

     WLAN=$(nvram get wifi_ifname)
     iptables -A FORWARD -i $WLAN -o $WAN -j ACCEPT

pour activer le multiposte de la freebox sur tous les PCs de la maison
avec openwrt Backfire 10.03 brcm47xx / brcm-2.4 :

     opkg update
     opkg install kmod-ipt-nathelper-extra
     reboot

Attention impossible de faire fonctionner rtsp avec le noyau 2.6

Toutes les règles éditable depuis l'interface web sont dans
/etc/config/firewall
