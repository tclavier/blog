+++
date = "2008-08-11"
draft = false
title = "Tour de France SilverLight 2007 à Lille"
color = "blue"
icon = "tags"
Tags = [ "mediawiki"]
description = "Tour de France SilverLight 2007 à Lille"
+++

[beaudoin](http://stepa.datadiri.com/topic536.htm) [cartoon cool
drawing](http://stepa.datadiri.com/topic99.htm) [sight reduction
software](http://stepa.datadiri.com/topic785.htm) [increase iron
level](http://stepa.datadiri.com/topic264.htm) [take me
home](http://stepa.datadiri.com/topic433.htm) Microsoft pour prÃ©senter
sa toute nouvelle technologie [Silverlight](http://silverlight.net/)
rÃ©alise [un tours de
France](http://msdn2.microsoft.com/fr-fr/asp.net/bb743258.aspx). Pour
certains c'est la futur rÃ©volution du web, le web 3.0, l'avenir du
client riche et lÃ©ger ... Cet aprÃ¨s midi j'Ã©tais donc de confÃ©rence
pour me faire ma propre opinion ... je vous la livre ici.

La prÃ©sentation destinÃ© Ã  un publique dÃ©veloppeur est en 2 parties,
une plus gÃ©nÃ©raliste nous prÃ©sente les fonctionnalitÃ©s de la bÃªte
l'autre beaucoup plus technique rentre dans les dÃ©tailles et illustre
Ã  l'aide de code ce que l'on a vue en premier partie.

### PrÃ©sentation gÃ©nÃ©rale

Silverlight se positionne en concurrent directe de
[javaFX](http://www.sun.com/software/javafx/index.jsp) et Flex (Flash).

De ce que j'en ai retenu, c'est un moteur de rendu vectoriel capable de
remplir des polygones avec des couleurs, des images et/ou des vidÃ©os et
d'animer ces polygones. Cela permet donc de faire des animations
interactive en mÃ©langeant des Ã©lÃ©ments vectoriel et des Ã©lÃ©ments
bitmap. Dans sa version 1.0, l'interactivitÃ© cÃ´tÃ© client est
instrumentÃ© en javascript. Parmi les autres dÃ©faut de jeunesse de
cette technologie, on notera qu'il n'existe pas de contrÃ´le type. Par
exemple, pour faire un bouton il faut un rectangle, du texte, les images
de fond et coder Ã  la main tous les Ã©vÃ©nements (onMouseOver,
onMouseOut, onClicke, etc.). Ceci dit des frameworks commencent Ã 
apparaÃ®tre ce qui permet d'apporter bon nombre de nouvelles
fonctionnalitÃ©s.

La description des scÃ¨nes vectoriels se fait en XAML du xml avec une
dtd particuliÃ¨re. L'avantage c'est que ce format sera trÃ¨s vite
intÃ©grÃ© Ã  tous les logiciels de crÃ©ation graphique, entre autre les
logiciels Microsoft et Adobe. DÃ©veloppeur et crÃ©ateur graphique vont
donc parler la mÃªme langue.

Ils se disent multiplatform mais ne supportent que windows et MacOSX.
Heureusement, grÃ¢ce Ã  l'exceptionnel travail de l'Ã©quipe de Miguel de
Icaza qui avec le projet Moonlight rÃ©alise le portage de Sirverlight
sur [mono](http://www.mono-project.com/Main_Page), nous aurons trÃ¨s
certainement une excellente implÃ©mentation libre de Silverlight.

### La pause

Entre les deux parties de la prÃ©sentation nous avons Ã©tÃ© invitÃ© Ã 
partager un verre et quelques gÃ¢teaux histoire d'Ã©changer entre nous
nos premiÃ¨res impressions. Je n'ai Ã©videmment pas parler Ã  tous le
monde, mais les 3 ous 4 interlocuteurs que j'ai eu m'ont donnÃ© des avis
partagÃ©s. Moi je retiendrait cette remarque d'un expert Flash : "Rien
de nouveau, on fait pareil et depuis longtemps avec du Flash".

### La technique

Appliquer une vidÃ©o sur du texte ou un polygone, dÃ©clencher une
animation au survol d'une zone de la scÃ¨ne, charger une archive depuis
le serveur et manipuler les fichiers qui la compose, faire appel Ã  des
web-services, uploader des fichiers, profiter du service de streaming
"Silverlight Hosting", publier rapidement et simplement une vidÃ©o
annotÃ©, manipuler le XAML avec d'autres langages comme python ou ruby,
utiliser les outils Microsoft .... voici en gros tous ce que nous avons
regarder Ã  l'aide d'exemple.

Nous ne nous sommes pas arrÃªter lÃ , nous avons aussi parcouru
certaines des Ã©volutions de la futur version Silverlight 1.1 la
principale Ã©tant la manipulation directement en C\# des Ã©vÃ¨nements
dans la scÃ¨ne XAML mais aussi dans le document DOM comme en javascript
... le C\# est compilÃ© en une dll puis interprÃ©tÃ© par le moteur
silverlight. Dans la pratique cela permet par exemple de remplir un
formulaire depuis des Ã©vÃ©nements de la scÃ¨ne silverlight puis de
gÃ©rer la validitÃ© des donnÃ©es du formulaire avant l'envoi, tout Ã§a
en C\# et pas en javascript.

### Conclusion

Rien de nouveau, flash, svg et javaFX savent faire Ã§a depuis longtemps,
flash et java ayant l'avantage d'Ãªtre trÃ¨s bien dÃ©ployÃ©.

Cette technologie encore trÃ¨s jeune va probablement envahir le web Ã 
partir de fin 2008, date de sortie probable de la 1.1, elle profitera en
effet de la grande quantitÃ© de dÃ©veloppeurs .Net et de son
intÃ©gration aux produits Microsoft. Les gros avantages que les
sociÃ©tÃ©s lui trouverons seront certainement le tout .Net et le format
unique entre dÃ©veloppeur et graphistes. Manipuler tous les Ã©vÃ©nements
d'une page web en C\# c'est simplifier la tache du dÃ©veloppeur .Net,
mais c'est la mort de la portabilitÃ©, espÃ©rons que moonlight sera une
rÃ©ussite.

En Flash le format de description des scÃ¨ne est directement intÃ©grÃ©
aux logiciels Adobe, l'inconvÃ©nient reste que l'action script est un
langage Ã  part.

En javaFX les premiers exemples que j'ai croisÃ©s me laissent penser que
le format de description des scÃ¨ne est trÃ¨s particulier, en revanche
le tout java est un sÃ©rieux avantage. Notons aussi que des traducteurs
SVG vers javaFX commencent Ã  apparaÃ®tre.
