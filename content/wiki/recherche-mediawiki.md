+++
date = "2007-06-20"
draft = false
title = "Recherche mediawiki"
color = "red"
icon = "reddit"
Tags = ["trucs et astuces", "mediawiki"]
description = "Recherche mediawiki"
+++

### Introduction

Par défaut, la recherche de terme dans mediawiki ne prend pas en compte
les mot de 3 lettres et moins. Or en informatique, des mots comme XEN,
VNC, etc. sont très fréquent.

### Petite explication technique

Mediawiki utilise pour ses recherche la fonctionnalité de recherche en
texte intégral (fulltext) de mysql. Cette option permet d'indexer
certains champs texte pour y faire des recherches évolué respectant
certaines contraintes de la langue. Pour que les indexes ne prennent pas
trop de place, la configuration par défaut ignore les mots de moins de 4
lettres. C'est le paramètre **ft\_min\_word\_len**

### Solution pratique

-   Modifier le fichier /etc/mysql/my.cnf pour modifier le paramètre
    **ft\_min\_word\_len**

    [mysqld]
    ft_min_word_len=3

-   relancer mysql
-   se connecter sur la base et lancer une réparation des index :

    mysql -u root -p wikidb
    mysql> REPAIR TABLE searchindex;

Voilà, c'est fait, maintenant vous pouvez chercher des mots de 3 lettres
dans votre wiki.
