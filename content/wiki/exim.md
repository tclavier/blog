+++
date = "2011-10-10"
draft = false
title = "Exim"
color = "light-green"
icon = "heart-o"
Tags = [ "mediawiki"]
description = "Exim"
+++

### Quelques notes

* forcer à renvoyer les mails bloqué en queue : `exim -qf` 
* chercher un motif dans la queue : `exiqgrep -ir email@domain.com`
* supprimer un message dans la queue : `exim -Mrm EXIM_MESSAGEG_ID`
* forcer à renvoyer les mails "frozen" : `exim -qff`

### Erreurs connue

    SMTP error from remote mail server after RCPT TO:<xxxxx@xxxx.fr>:
    host host.fqsn [YY.YY.YY.YY]: 504 5.5.2 <host>:
    Helo command rejected: need fully-qualified hostname

Il faut modifier le nom de la machine dans les fichiers `/etc/hostname` et `/etc/hosts` puis lancer `dpkg-reconfigure exim4-config`
