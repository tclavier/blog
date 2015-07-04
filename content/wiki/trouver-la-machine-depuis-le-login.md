+++
date = "2006-06-28"
draft = false
title = "Trouver la machine depuis le login"
color = "light-blue"
icon = "ship"
Tags = ["windows","trucs et astuces", "mediawiki"]
description = "Trouver la machine depuis le login"
+++

Comment trouver sur un réseau windows le nom d'une machine avec juste le
login de l'utilisateur actuellement connecté dessus ?

Solution 1
----------

envoyer un message windows à l'utilisateur avec la commande suivante :

` net send `<login>` un message disant de ne pas faire attention`

regarder dans le cache des résolutions de nom !NetBios avec la commande
:

     nbtstat -c

ce qui donne :

                  NetBIOS Remote Cache Name Table

        Name              Type       Host Address    Life [[sec]
      ------------------------------------------------------------
      <LOGIN>       <20>  UNIQUE      III.ZZZ.YY.XXX       600

il ne reste plus qu'a trouver le nom de la machine, pour faire ça, on
utilise par exemple la commande :

     tracert III.ZZZ.YY.XXX

On obtient alors une ligne qui ressemble à ça:

` Tracing route to `<Nom de machine>` [[III.ZZZ.YY.XXX]`

Voilà, alors que l'on ne connaissait que <login>, on a trouvé
<nom de machine>. C'est une solution très rapide mais pas discrète.
L'autre désavantage c'est que si l'utilisateur est connecté sur
plusieurs machine je ne sais pas quelle est la machine que l'on trouve.

Solution 2
----------

télécharger !PsLoggedOn sur
<http://www.sysinternals.com/ntw2k/freeware/pstools.shtml> puis lancer

` psloggedon.exe `<login>

ça marche très bien, mais c'est très long, cet outils scan toutes les
machines du réseau. Il faut savoir être patient
