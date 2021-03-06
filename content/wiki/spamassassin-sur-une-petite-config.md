+++
date = "2008-07-15"
draft = false
title = "Spamassassin sur une petite config"
color = "lime"
icon = "file-movie-o"
Tags = ["linux", "mediawiki"]
description = "Spamassassin sur une petite config"
+++

En quelques mots voici les problèmes que j'ai rencontrés, et la solution
que j'ai fini par trouver.

### Les symptômes

Un spamassassin qui tournait drôlement bien sur une grosse machine
(Athlon 2,4GHz avec 2G de Ram) à été migré sur une machine virtuelle Xen
avec 96Mo de Ram. Le trafic étant très faible, à peine quelques
centaines de mail par jour récupérés pour moitié par fetchmail, la
migration devait se dérouler sans accroc ! Seulement voilà, à peine
quelques heures après la migration, des erreurs comme ça dans le
paniclog d'exim (exim4 pour être précis) :

     spam acl condition: error reading from spamd socket: Connection timed out

Google étant mon amis, je cherche mais ne trouve pas de solution, à
première vue certains messages mettent 300 secondes à être scanné mais
rien de plus. Avec spamassassin en debug et 1 seul fils, je découvre
qu'au bout d'un temps plus ou moins court le spamd ne répond plus, une
simple interrogations avec spamc peut rester bloquer jusqu'au CTRL+C
salvateur (après plus de 10mins).

### La solution

Après avoir tester plein de truc, après avoir épluché la doc de
spamassassin, la solution est arrivé à travers l'option suivante :

     lock_method flock

dans le local.cf

Et oui, en fait ce qui bloquait spamd c'était tout simplement un
inter-bloquage sur la base de données Bayes (ou Bayesian) Je ne suis pas
rentré dans le détaille, mais croisons les doigts, ça marche depuis
12h00 sans aucun problème.

### Optimisons

avec sa-compile il est maintenant possible de compiler le perl pour
n'avoir que du binaire natif, ça n'économise pas la ram, mais le CPU ;-)
Pour l'activer, il faut décommenter une ligne dans

     /etc/spamassassin/v320.pre

installer re2c

     apt-get install re2c

et lancer sa-compile

    sa-compile

cette dernière commande est à relancer à chaque mise à jour des règles

Autre point important, en ajoutant la configuration suivante dans le
user\_prefs :

    bayes_auto_expire 0

et l'action suivante une fois par jour :

    sa-learn --force-expire

on demande à spamassassin de ne pas recalculer les éléments qui doivent
expirer de la base Bayesian à chaque lecture ou presque mais juste de le
faire 1 fois par jour.
