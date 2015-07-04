+++
date = "2006-08-23"
draft = false
title = "Etude du wrt54g"
color = "red"
icon = "bell-slash"
Tags = ["projets","lille sans fil", "mediawiki"]
description = "Etude du wrt54g"
+++

Description Technique
---------------------

### Les interfaces réseau

-   eth1 : Une interface wifi 802.11g (54Mbps) WLAN
-   eth0 : Regroupe toutes les interfaces réseau 10/100 Mbps
-   br0 : le bridge, par défaut, il regroupe vlan0 et eth1, cela permet
    de regrouper plusieurs interface réseau en une seule.
-   vlan0 : la 4 prises réseaux du LAN
-   vlan1 : la prise internet (WAN)

Openwrt et Réseau citoyen
-------------------------

virer le bridge et configuration IP des interfaces

    nvram set lan_ifname=vlan0
    nvram set lan_ipaddr=192.168.1.1
    nvram set lan_netmask=255.255.255.0
    nvram set lan_proto=static

    nvram set wan_ifname=vlan1
    nvram set wan_proto=dhcp

    nvram set wifi_ifname=eth1
    nvram set wifi_ipaddr=10.59.12.18
    nvram set wifi_netmask=255.0.0.0
    nvram set wifi_proto=static
    nvram commit

configuration radio

    nvram set wl0_mode=sta
    nvram set wl0_infra=0
    nvram set wl0_closed=0
    nvram set wl0_channel=1
    nvram set wl0_ssid=bombolong
    nvram commit

lancer olsrd

    echo "olsrd -i eth1 &" > /etc/init.d/S50olsrd
    chmod +x /etc/init.d/S50olsrd

Les astuces
-----------

### Faire 1 vlan par prise réseau

en nvram renseigner les variables suivantes :

    vlan0hwname=et0
    vlan0ports=1 5*
    vlan1hwname=et0
    vlan1ports=0 5
    vlan2hwname=et0
    vlan2ports=2 5
    vlan3hwname=et0
    vlan3ports=3 5
    vlan4hwname=et0
    vlan4ports=4 5

après un reboot, vous avez 1 vlan par prise réseau. Il faut affecter une
IP à chaque vlan manuellement, le firmware ne sait pas le faire
automatiquement :-)
