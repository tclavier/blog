+++
date = "2006-05-29"
draft = false
title = "Filtrer son courrier"
color = "red"
icon = "flask"
Tags = ["documentation tcweb", "mediawiki"]
description = "Filtrer son courrier"
+++

Introduction
------------

Pour filtrer son courrier, c'est à dire ranger dans les bons répertoires
les courriels dès leur arrivé dans le bon dossier. Une solution est
d'utiliser procmail. L'avantage c'est que le filtrage est effectué
directement sur le serveur à la reception du mail.

Cela peut être utile pour ranger dans un répertoire spécifique les
messages qui ont été détecté comme SPAM par le serveur. Il existe
d'ailleurs un article consacré à la [Gestion du
spam](/wiki/gestion-du-spam)

Mode opératoire
---------------

Prendre la main sur le serveur en ssh, avec [PuTTY](/wiki/putty) ou
tout autre client ssh. Puis avec votre éditeur de fichier favoris,
éditer le fichier \~/.procmailrc

Voici un exemple de fichier .procmailrc :

    PATH=$HOME/bin:/usr/bin:/global/bin:/usr/ucb:/bin:/usr/local/bin:
    MAILDIR =       $HOME/Maildir
    DEFAULT =       $MAILDIR/
    LOGFILE =       $MAILDIR/procmail.log
    LOCKFILE=       $HOME/lockmail

    # un répertoire par mois pour les mailing listes
    ML_DATE=`date +%Y%m`                     
    ML=.ml.$ML_DATE

    # règle de suppression des doublons
    :0 Wh: msgid.lock
    |formail -D 8192 .msgid.cache

    # filtrer les mails des Listes debian
    :0 H
    * ^X-Mailing-List:.*[<].*lists\.debian\.org[>]
    * ^X-Mailing-List:.*[<] *\/[^ ][^@]*
    $ML.$MATCH/

    # Déplacer les mails que clamav détecte comme virus dans un répertoire virus
    :0 H
    * ^X-Virus-Found: Yes.*
    .virus/

    # Déplacer les mails que spamassassin détecte comme spam dans un rep spam
    :0 H
    * ^X-Spam-Flag: Yes
    .spam/

Pour plus d'information, je vous renvois à la documentation de procmail.
