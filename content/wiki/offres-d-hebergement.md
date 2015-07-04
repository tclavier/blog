+++
date = "2010-06-11"
draft = false
title = "Offres d'hébergement"
color = "light-blue"
icon = "angle-double-right"
Tags = [ "mediawiki"]
description = "Offres d'hébergement"
+++

Alors qu'en 2006 Iliad et sa dedibox révolutionnait l'offre des serveurs
dédié, aujourd'hui online.net vient de lancer une nouvelle offre encore
plus révolutionnaire. Comparaison de ces solutions d'hébergement :

Descriptif des offres
---------------------

Avant toute chose petit descriptif des offres

### dedibox

dedibox est une marque de la société online.net qui fait partie du
groups Iliad.

-   [dedibox](http://www.dedibox.fr)

### kimsufi

marque du groupe OVH

-   [kimsufi](http://www.kimsufi.com/)

### gandi

Un grand nom du DNS

-   [gandi](https://www.gandi.net/hebergement/)

Comparaison
-----------

### récapitulatif

  Offre        Disque   Ram      CPU                IP   Prix
  ------------ -------- -------- ------------------ ---- ------------------
  dedibox v3   160G     2Go      Nano 1.6GHz        2    15 HT + 40 HT
  dedipro v2   2×2To    8Go      Xeon (8×1,86GHz)   12   100 HT + 40 HT
  kimsufi KS   250G     2048Mo   Celeron 1.2GHz     4    15 HT + 50 HT
  kimsufi 4T   2×2To    12Go     i7 (8×2.66GHz)     4    100 HT + 50 HT
  kimsufi mC   5Go      256Mo    8GHz               1     0.01 HT / heure
  gandi        5G       256Mo    1 Coeur            1    12 HT

Difficile de comparer dans ces conditions la seul chose de comparable
c'est la connections, pour le reste difficile ... d'autant plus que chez
OVH les frais d'installations sont offert si on s'engage pour 1 ans ...

Prenons un repère de comparaison, le prix et observons ce que l'on a
pour 120€HT par an chez chacun on imagine par exemple partager les
machines les plus onéreuses entre amis grace à la virtualisation :

  Offre        Disque   Ram     IPs   cpu    Raid       Commentaire
  ------------ -------- ------- ----- ------ ---------- ---------------------------------------------------
  dedibox v3   80Go     896Mo   1     0.5    non        
  dedipro v2   400Go    790Mo   1     0.8    possible   
  kimsufi KS   130G     896Mo   2     0.5    non        
  kimsufi 4T   315Go    925Mo   1     0.6    possible   obligé d'activer l'usage pro pour avoir plus d'IP
  kimsufi mC   6.8Go    350Mo   1     8GHz   oui
  gandi        5Go      256Mo   1     1      oui

J'ai réservé 256Mo de ram pour l'hyperviseur dans tous les cas ou il
fallait diviser la machine et je n'ai pas prix en compte la réduction
lié à l'engagement qui existe chez OVH. Perso j'avoue que l'offre
dedibox pro v2 partagé en 10 me semble le meilleur rapport prestation /
prix. On remarque le Kimsufi mini Cloud qui sort du lot question CPU.
