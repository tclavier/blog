+++
Categories = ["Technique"]
Description = "Changer la police de votre site par Linux Biolinum"
Tags = ["Linux Biolinum", "Linux Libertine", "css", "font"]
color = "teal"
date = "2015-11-16T17:31:04+02:00"
icon = "font"
title = "Linux Biolinum"
draft = false
+++

[Linux Libertine](http://www.linuxlibertine.org) est une police de caractères numériques libre, dotée d'un riche jeu de glyphes. Le seul problème de cette police c'est qu'elle est globalement peut distribué. Son homologue linéales (sans-serif) est la police Linux Biolinum. 

L'empattement impacte directement la lisibilité, avec une très grande résolution comme en impression papier ou sur un écran avec une résolution extrêmement élevée, l'empattement va amélioré la lisibilité. En revanche sur une faible résolution comme un écran standard à moins de 100 dpi, l'empattement va être perçu par l'œil comme du bruit et donc dégrade la lisibilité. C'est pour cette raison que j'ai pris l'habitude de mettre la police Linux Biolinum sur certains sites. Voici donc comment faire en quelques lignes.

# Téléchargement

La première chose à faire c'est de télécharger les fichier `woff` correspondants aux différentes variantes de la police :

    #!/bin/bash
    wget http://linuxlibertine.sourceforge.net/fonts/LinBiolinum_R.woff   -O fonts/LinBiolinum_R.woff
    wget http://linuxlibertine.sourceforge.net/fonts/LinBiolinum_RB.woff  -O fonts/LinBiolinum_RB.woff
    wget http://linuxlibertine.sourceforge.net/fonts/LinBiolinum_RI.woff  -O fonts/LinBiolinum_RI.woff

# CSS

La seconde étape consiste à déclarer les fichiers de polices dans votre feuille de style :

    font-face {
        font-family: "Linux Biolinum";
        src: url('/fonts/LinBiolinum_R.woff') format('woff');
    }

    @font-face {
        font-family: "Linux Biolinum";
        font-style: italic;
        src: url('/fonts/LinBiolinum_RI.woff') format('woff');
    }

    @font-face {
        font-family: "Linux Biolinum";
        font-weight: bold;
        src: url('/fonts/LinBiolinum_RB.woff') format('woff');
    }

En déclarant ainsi les 3, nous pourrons profiter des variantes italique et grasse de la police. Il ne reste plus qu'à l'utiliser dans notre document, la feuille de style pourra par exemple avoir les lignes suivante : 

    body {
        font-family: 'Linux Biolinum';
        font-size: 16px;
    }


