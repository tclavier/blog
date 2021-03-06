+++
date = "2008-02-21"
draft = false
title = "Gestion du spam"
color = "orange"
icon = "hospital-o"
Tags = ["documentation tcweb", "mediawiki"]
description = "Gestion du spam"
+++

Introduction
------------

Sur TcWeb, le serveur de mail est équipé d'un antispam à la fois
puissant et très évolué : SpamAssassin. Comme c'est un outils
informatique, je pense qu'il est important de souligner qu'il ne peut
pas être parfait.

Grace aux progrès de l'intelligence artificiel, ce logiciel est capable
d'apprendre, seulement cela n'est possible que si vous, utilisateurs,
vous lui indiquez ses erreurs.

Pour mener à bien cette mission, deux ou trois manipulations sont à
réaliser. Afin de bien comprendre le pourquoi de ces manipulations, je
vous expliquerais d'abord ce qui se cache derrière cet apprentissage et
pour finir nous détaillerons la marche à suivre.

D'un point de vue technique
---------------------------

### Attribuer une note

Techniquement c'est très simple. L'antispam va attribuer une note à tous
les messages en fonction de nombreux critères. En fonction de la note
obtenu il traitera le mail de façon différentes :

-   si la note est inférieur à 5, alors ce n'est pas du spam, c'est du
    ham, le serveur de mail ajoute une ligne dans les entêtes, par
    exemple :

     X-Spam-Score: -1.4 (-)

cette ligne qui donne la note que l'antispam à donner au mail permet
surtout de voir si l'antispam à bien fait son travail.

-   si la note est comprise entre 5 et 15, alors c'est un spam, le
    serveur de mail va ajouter plusieurs lignes dans l'entête du mail :

     X-Spam-Score: 5.9 (+++++)

donne la note. La petite ligne avec des + est une représentation de la
note. Elle permet un filtrage fin avec procmail ou votre lecteur de mail
favori. Le seconde champs, qui en règle générale correspond à plusieurs
lignes :

     X-Spam-Report: Spam detection software, ...

correspond au rapport complet de SpamAssassin, cela permet de savoir
pourquoi ce mail est classé comme spam. La ligne suivante :

     X-Spam-Flag: Yes

Permet de filtrer très efficacement votre courrier. Si vous voulez
utiliser procmail sur le serveur pour filtrer votre courrier, je ne peux
que vous conseiller de lire [cette
page](/wiki/filtrer-son-courrier)

-   si la note dépasse 20, alors le serveur de mail refuse le message.

### Les cas d'erreurs

SpamAssassin ne peut se tromper que de 2 façon différentes :

-   soit le message n'est pas un spam, c'est du ham, pourtant
    SpamAssassin le classe comme spam.
-   soit le message est un spam et pourtant SpamAssassin ne l'a pas vue
    comme tel.

le protocole IMAP permet de partager des répertoires j'ai donc créer sur
le compte de spamassassin deux répertoires partagés : faux\_spam et
vraie\_spam.

Toutes les nuits, un robot scrute ces répertoires pour apprendre à
SpamAssassin ces erreurs. Il lui redonne tous les messages présent dans
faux\_spam en lui indiquant que ce sont des bons mail (du ham) et
redonne tous les messages présent dans vraie\_spam en lui indiquant que
c'est du spam.

D'un point de vue utilisateur
-----------------------------

Pour les utilisateurs, la manipulation est simple, il suffit de rajouter
si ce n'est pas déjà fait les répertoires IMAP partagés. Pour se faire,
connectez vous en ssh (avec [PuTTY](/wiki/putty) par exemple) sur
tcweb.org et tappez la commande suivante :

     maildirmake --add spam=/home/spam/shared Maildir/

Une fois cette opération réalisé, vous trouverez dans votre lecteur de
mail favorit un répertoire *shared* et dans ce répertoire un
sous-répertoire *spam* et enfin dans ce sous-répertoire deux répertoires
*faux\_spam* et *vraie\_spam*.

Chaque fois que vous trouvez une erreur de SpamAssassin, vous copiez ou
déplacez le message dans le répertoire correspondant :

-   si le message n'est pas classé comme spam alors que ça en est un,
    déposez le dans *vraie\_spam*
-   si le message est classé comme spam par erreur copiez le dans
    *faux\_spam*

Conclusion
----------

Maintenant, vous êtes capable d'apprendre à SpammAssassin comment mieux
détecter le spam. Pour ranger le spam dans un répertoire spécifique dès
son arrivé, je vous invites à lire l'article [Filtrer son
courrier](/wiki/filtrer-son-courrier)
