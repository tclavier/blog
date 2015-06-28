+++
date = "2013-06-13"
draft = false
title = "Tnef"
color = "orange "
icon = "slack"
Tags = ["documentation tcweb", "mediawiki"]
description = "Tnef"
+++

TNEF pour Transport Neutral Encapsulation Format, c'est un format de
mail propriété de microsoft et utilisé par Microsoft Outlook, Microsoft
exchange et Microsoft Outlook express. Les messages au format TNEF se
caractérisent dans les lecteurs de mail non microsoft par une pièce
jointe nommé winmail.dat ou win.dat. Le type mime annoncé est
application/ms-tnef.

L'avantage de ce format c'est de pouvoir transporter un certains nombre
d'informations directement utilisable par les outils microsoft comme un
rendez-vous automatiquement ajouté dans le calendrier.

Le gros inconvénient de ce format, c'est que tous les autres lecteurs
sont bien incapable de décoder ce genre de fichier.

### Pour ne pas envoyer de TNEF

Afin d'être compatible avec tout le monde, il est vivement conseillé
d'envoyer vos documents en texte ou HTML.

Mode opératoire :

-   Dans le menu "Outils" d'Outlook, cliquez sur "Options",
-   puis sur l'onglet "Format du courrier électronique."
-   Dans la zone "Format du message", cliquez sur "Texte brut" ou
    "HTML",
-   puis cliquez sur "OK".

Vous trouverez plus d'information sur [le support
microsoft](http://support.microsoft.com/kb/290809)

### MTA

Pour un administrateur système, la première idée, c'est de décoder
automatiquement ces pièces jointes sur les serveurs, seulement, que ce
soit avec exim ou procmail, c'est une mauvaise idée de remplacer la
pièce jointe (winmail.dat) par tout ce qu'elle contient. Même s'il est
vrai que ce serait la solution la plus pratique, un agent de transport
ne doit pas modifier les messages. En effet, comment vérifier une
signature de message alors que le message n'est plus le même. De même
cette opération n'est pas possible si le message est crypté. C'est pour
ces raisons et certainement bien d'autres que les MTA ne transforme pas
les messages TNEF à la volé en d'autres formats plus standard et lisible
sur tous les lecteurs de mail.
