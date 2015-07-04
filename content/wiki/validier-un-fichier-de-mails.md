+++
date = "2011-04-07"
draft = false
title = "Validier un fichier de mails"
color = "purple"
icon = "sort-up"
Tags = [ "mediawiki"]
description = "Validier un fichier de mails"
+++

Imaginons un fichier texte remplis d'adresses mails comme par exemple
une extraction de la base client, 1031 mails pour être précis ... L'idée
c'est d'envoyer les vœux pour la nouvelle année à tous ces clients ...
seulement dans le lot certains mails sont mal orthographiés.

Voici comment j'ai mis à jour la liste grâce au service [ChekMail de
Sabisu](http://sabisu.fr/checkmail/) en utilisant quelques ligne de
shell bash

    for mail in $(cat mails.txt)
    do 
`  wget -q `[`http://sabisu.fr/checkmail/$mail`](http://sabisu.fr/checkmail/$mail)` -O - `\
      echo 
    done | sed -e '/^\s*$/d' > good.txt

2 min et 5 secondes plus tard j'ai une liste de 570 mails valide dans le
fichier good.txt.
