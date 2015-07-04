+++
date = "2007-11-30"
draft = false
title = "Clavier Français sous Linux"
color = "light-blue"
icon = "pinterest-p"
Tags = ["trucs et astuces","linux", "mediawiki"]
description = "Clavier Français sous Linux"
+++

![](Clavier latin9.png "fig:Clavier latin9.png") Sous Linux, la saisie
de caractères spécifique à notre belle Langue comme le É le â ou
simplement l'€ sont grandement simplifié en utilisant le clavier Latin9
Le hic c'est de se souvenir que le æ c'est Alt Gr + g ... Second
problème mais mineur, c'est que certains symbole ne sont plus
directement accessible en latin 9 comme le ¤ (Alt Gr + \$). Mais
personnellement je n'utilise quasiment jamais ce symbole et je trouve
bien plus pratique de pouvoir faire simplement le œ ou × et ÷ qui
servent bien plus souvent que ¤

Pour configurer un clavier Latin 9 dans Xorg, il suffit dans le fichier
/etc/X11/xorg.conf de remplacer :

    Option        "XkbLayout"    "fr"

par

    Option        "XkbLayout"    "fr-latin9"

puis de relancer le serveur X

sous Gnome, l'outil de configuration de clavier doit aussi pouvoir faire
l'affaire.
