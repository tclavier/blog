+++
date = "2006-11-29"
draft = false
title = "Faire maigrir une debian"
color = "orange"
icon = "building-o"
Tags = ["trucs et astuces","linux", "mediawiki"]
description = "Faire maigrir une debian"
+++

### ou Nettoyer sa Debian

Il y a une chose vraiment génial avec debian, c'est la gestion des
paquets. Un simple

     apt-get install truc

vous installe le logiciel truc ainsi que toutes les dépendances, c'est à
dire, l'ensemble des bibliothèques et autres logiciels indispensable à
son bon fonctionnement. Seulement en sens inverse, quand vous supprimez
le paquet truc, cela n'enlève pas les bibliothèques car elles pouraient
être utilisés par un autre logiciel, vous pourriez très bien les avoir
installées pour votre propre utilisation, enfin bref, apt les laisse sur
votre disque. Il y a bien aptitude qui sait gérer ce genre de choses,
mais il faut tout gérer avec aptitude, difficile sur une vielle debian.

Donc voilà, au bout de quelques années d'utilisation, certaines
bibliothèques ne sont plus utilisées, et elles continuent à envahir
votre disque dur. De même, certains logiciels sont réguliairement mis à
jour alors que cela fait des lustres que vous ne les avez pas utilisés.

Une nouvelle quête vient de naître : faire de la place sans perdre de
données et sans altérer les logiciels que vous utilisez.

Toutes les astuces suivantes ne sont utilisables que si toutes les
applications ont été installées avec apt et pas "à la main"

-   Le cache apt, la commande suivante permet de supprimer les vieux
    .deb qui ne sont plus utiles (sauf cas très particuliers)

     apt-get autoclean

-   installer le paquet debian-goodies, la commande dpigs donne ensuite
    les plus gros paquets installés, il suffit alors de vérifier leur
    utilité.

<!-- -->

-   installer localepurge qui permet de supprimer les données de langues
    non utilisées

<!-- -->

-   utiliser itérativement deborphan et lui faire confiance

     apt-get remove $(deborphan)

Il existe debfoster qui permet de différencier comme avec aptitude les
paquets qui ont été installé par dépendance et les autres. Le seul
problème, c'est qu'il faut initialiser la base à l'installation. Tâche
difficile si la machine a déjà quelques années de vie.
