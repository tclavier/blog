+++
date = "2010-12-02"
draft = false
title = "Vol de discussion"
color = "teal"
icon = "soundcloud"
Tags = ["inclassable", "mediawiki"]
description = "Vol de discussion"
+++

Si vous participez à des mailing listes, il vous est peut-être arrivé
d'entendre parler de vol de discussion ou vol de thread. Voici en
quelques mots une petite explication technique qui vous permettra de
mieux comprendre de quoi il retourne.

### Des en-têtes

Les mails ou courriels en français, sont tous construits de la même
façon. Une zone d'en-tête et une zone de corps. Dans la zone d'en-tête,
on retrouve un grand nombre d'informations comme les serveurs qui ont
relayé le message, un identifiant unique ou le destinataire. Seulement
parmis toutes ces entêtes, on trouve deux champs :

    References: <4559D679.3050804@toto.titi> <5799421.33921163487260036.example.com> <20061114072742.GB22936@foo.bar>
    In-Reply-To: <20061114072742.GB22936@foo.bar>

Ces deux champs "References" et "In-Reply-To" sont utilisés par les
lecteurs de mails pour trier par discussion.

Dans notre exemple, le message fait partie d'une discussion de trois
autres messages, et c'est d'ailleurs la réponse au dernier.

### En pratique

Lorsque l'on fait "répondre" sur un message, le lecteur de mails
renseigne tout seul ces deux champs... Quand, pour poser une nouvelle
question, on fait "répondre" à un message puis que l'on change le corps
et le sujet, ces deux champs sont toujours renseignés. Dans tous les
lecteurs de mails évolués le nouveau message vas être classé à la suite
de la discussion. La nouvelle discussion se retrouve noyée dans
l'ancienne.

Ce ne serait pas bien grave si ça n'avait pas de conséquences. Seulement
voilà, d'une part la discussion d'origine devient très confuse, mais en
plus, certains contributeurs, souvent les plus actifs, utilisent de
vrais lecteurs de mails, capables d'ignorer la totalité d'une
discussion, y compris les nouveaux messages. Il est donc probable que
votre nouvelle discussion se retrouve dans un tel filtre... si c'était
une question, il y a fort à parier que vous aurez beaucoup moins de
réponses.
