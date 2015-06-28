+++
date = "2007-05-06"
draft = false
title = "Flash java et mandriva"
color = "orange "
icon = "dropbox"
Tags = ["linux","trucs et astuces", "mediawiki"]
description = "Flash java et mandriva"
+++

Mémo rapide pour installer la plugin java et le plugin macromedia flash
sous mandriva ...

#### Java

-   Télécharger le package "RPM" du JRE sur <http://java.sun.com>
-   Dans le rep de téléchargement lancer sous root la commande suivante
    :

     sh jre*

-   La machine virtuelle Java est alors installé, seulement, le
    navigateur firefox n'a pas le plugins ... pour le rajouter, il faut
    faire un lien symbolique vers le répertoire des plugins

     ln -s /usr/java/jre1.5.0_06/plugin/i386/ns7/libjavaplugin_oji.so /usr/lib/mozilla-firefox-1.0.6/plugins/

#### Flash

-   Télécharger le rpm : <http://macromedia.mplug.org/> ou là pour la
    version à la date de la rédaction de cet article :
    <http://macromedia.rediris.es/rpm/mandrake/flash-plugin-7.0.61-1.i386.rpm>
-   Dans le répertoire de téléchargement :

     urpmi flash-plugin-7.0.61-1.i386.rpm

#### Konqueror

Après avoir installer konqueror-nsplugin, dans les options de konqueror,
dans la section "Modules Externes" ajouter le répertoire
"/usr/lib/mozilla-firefox-1.0.6/plugins" pour la recherche de nouveaux
plugins

#### Vérification

Dans firefox, entrez l'URL suivante : <about:plugins> il devrait y avoir
un tableau parlant de "Java (TM)" et de "Shockwave Flash"
