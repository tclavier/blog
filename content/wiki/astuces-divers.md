+++
date = "2010-02-24"
draft = false
title = "Astuces divers"
color = "yellow"
icon = "glass"
Tags = [ "mediawiki"]
description = "Astuces divers"
+++

### tcpdump

capturer du trafic avec tcpdump pour l'analyser dans wireshark
anciennement ethereal :

    tcpdump -s 0 -w /tmp/fichier.dump

reste à ouvrir /tmp/fichier.dump dans wireshark
