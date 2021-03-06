+++
date = "2008-07-29"
draft = false
title = "Migration argbs-ws01"
color = "lime"
icon = "arrow-right"
Tags = [ "mediawiki"]
description = "Migration argbs-ws01"
+++

Éléments à migrer :

-   MTA
-   comptes gaxuxa : mail + login / pass
-   comptes gaxuxa2 : mail + login / pass
-   serveur pop et imap
-   webmail : RoundCube
-   ihm d'admin
-   mailing listes ezml

Conf MTA

    rsync -a --progress gaxuxa2.argia.fr:/etc/postfix /etc/
    rsync -a --progress gaxuxa2.argia.fr:/etc/courier /etc/
    rsync -a --progress gaxuxa2.argia.fr:/etc/mailman /etc/

Comptes gaxuxa2

    ssh gaxuxa2.argia.fr "mysqldump -u root -p postfix" | mysql -u root -p postfix
    rsync -a --progress --delete gaxuxa2.argia.fr:/home/vmail/* /srv/vmail/

Comptes gaxuxa

-   prendre dans /var/qmail/control/rcpthosts et
    /var/qmail/control/virtualdomains pour l'inclure dans domain

    for dom in $(cat /var/qmail/control/rcpthosts)
      do echo "insert into domain (domain, created, active) values ('$dom', sysdate(), 1) ;"
    done

-   recup des mails

    rsync -a --progress /var/qmail/popboxes/domain-tld /home/vmail/domaine.tld

-   récup des comptes et mot de passe (/var/qmail/users/poppasswd et
    /var/qmail/users/assign)

    grep domain-tld /var/qmail/users/assign \
    | grep = \
    | sed -e "s/=domain-tld-/insert into mailbox (username, maildir, created, active) values ('/" -e "s?:popuser:888:888:/var/qmail/popboxes/domain-tld?', 'domain.tld?" -e "s?:::?/', sysdate(), 1)?"

-   récup des mailing liste

    grep domain-tld /var/qmail/users/assign \
    | grep + \
    | sed -e 's/.*popuser:888:888://' -e 's/:-.*//'

-   pour chaque entrée, créer la liste et reprendre les abonnés

    sur gaxuxa ezmlm-list /rep/ver/ma_liste 
    sur la nouvelle machine
    newlist --urlhost=listes.domaine.tld --emailhost=domaine.tld ma_liste postmaster@domaine.tld PassWord
    add_members --welcome-msg=n --admin-notify=n ma_liste --regular-members-file=-

-   recup des mailing listes de gaxuxa2

    rsync -a --progress gaxuxa2.argia.fr:/var/lib/mailman/lists /var/lib/mailman/
    rsync -a --progress gaxuxa2.argia.fr:/var/lib/mailman/archives /var/lib/mailman/
    /usr/lib/mailman/bin/genaliases

-   récup d'une base pgsql sur gaxuxa

    ssh gaxuxa.argia.fr "/usr/local/pgsql/bin/pg_dump -U postgres -d forumcsei -Fc" | su postgres -c "pg_restore -c -d forumcsei"

### Liens

-   <http://doc.ubuntu-fr.org/serveur/postfix_mysql_tls_sasl>

