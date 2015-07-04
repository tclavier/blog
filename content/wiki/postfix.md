+++
date = "2010-03-09"
draft = false
title = "Postfix"
color = "grey"
icon = "institution"
Tags = ["trucs et astuces", "mediawiki"]
description = "Postfix"
+++

### Lancer un script à la réception d'un mail sur un postfix avec de la virtualisation de domaine et mysql

dans main.cf :

    virtual_alias_maps = ..., hash:/etc/virtual-aliases
    alias_maps = ..., hash:/etc/aliases

contenu du fichier /etc/virtual-aliases

    test@example.com             test

contenu du fichier /etc/aliases

    test: "|/rep/du/script/test.sh"

droit d'exécution sur le script

    chmod +x /rep/du/script/test.sh

génération des .db

    newaliases
    postmap /etc/virtual-aliases

reste plus qu'à envoyer un mail à test@example.com pour lancer
/rep/du/script/test.sh

### Missing .db file

    postmap /etc/postfix/relay_recipients
