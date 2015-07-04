+++
date = "2011-10-10"
draft = false
title = "Exim"
color = "grey"
icon = "calculator"
Tags = [ "mediawiki"]
description = "Exim"
+++

### Quelques notes

-   forcer à renvoyer les mails bloqué en queue : exim -qf

    * forcer à renvoyer les mails "frozen" : exim -qff

-   chercher un motif dans la queue : exiqgrep -ir email@domain.com
-   supprimer un message dans la queue : exim -Mrm EXIM\_MESSAGEG\_ID

### Erreurs connue

        SMTP error from remote mail server after RCPT TO:<xxxxx@xxxx.fr>:
        host host.fqsn [YY.YY.YY.YY]: 504 5.5.2 <host>:
        Helo command rejected: need fully-qualified hostname

    vi /etc/hostname
    vi /etc/hosts
    dpkg-reconfigure exim4-config
