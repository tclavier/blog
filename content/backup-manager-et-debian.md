Title:Backup-manager et debian
Date:2011-06-10
Tags:  mediawiki

Introduction
------------

Quelques notes sur la configuration de backup-manager pour faire les
sauvegardes d'une debian par exemple les domU de la dedibox sur une
communauté dl.free.fr

La communauté
-------------

-   Créer une communauté sur dl.free.fr :
    <http://dl.free.fr/team/create>
-   Créer un utilisateur par exemple (backup : motdepasse)

une fois créé la communauté va avoir une URL du genre
<http://dl.free.fr/A012345/mes_backups> l'identifiant de la communauté
c'est le hash entre dl.free.fr et le nom de la communauté ici : A012345.
Le login d'upload sera donc : backup@A012345

Installation
------------

Installer backup-manager

` apt-get install backup-manager`

répondre aux question de debconf :

-   Dépot des archives : /var/archives
-   Utilisateur propriétaire du dépôt : root
-   Groupe propriétaire du dépôt : root
-   Format des archives : tar.gz
-   Fréquence de la tâche périodique de cron : quotidienne
-   Suivre les liens symboliques ? : non
-   Format de nommage des archives : long
-   Durée de vie des archives (jours) : 2
-   Répertoires à archiver : /etc /home /var/backups /usr/local ...
-   Répertoires à exclure des archives : /var/archives
-   Faut-il chiffrer les archives : oui
-   Faut-il activer le système d'envoi automatique ? : oui
-   Mode de transfert : ftp
-   Liste des hôtes distants : dl.free.fr
-   Utilisateur FTP : backup@A012345
-   Mot de passe FTP : motdepasse
-   Dépôt sur l'hôte distant : /
-   Faut-il activer la gravure automatique ? : non

Il n'est pas utile de purger les anciens backup sur dl.free.fr :

`vi /etc/backup-manager.conf`\
`export BM_UPLOAD_FTP_PURGE="false"`

incrémental + pipe

`export BM_ARCHIVE_METHOD="tarball-incremental pipe"`

Testons si tout marche :

`backup-manager -v`

Faire le ménage entre 2 tests :

`rm -rf /var/archives/*`

Astuces
-------

Tous les scripts présenté ici sont disponible sur
<http://svn.sharengo.org/svn/utils/backups/>

### Debian

en utilisant l'option pipe de backup-manager et les 4 lignes de
configuration suivante, il est possible de sauver la liste des paquets
actuellement installé :

`# Debian`\
`BM_PIPE_COMMAND[0]="/usr/bin/dpkg --get-selections"`\
`BM_PIPE_NAME[0]="dpkg"`\
`BM_PIPE_FILETYPE[0]="txt"`\
`BM_PIPE_COMPRESS[0]="gzip"`

Le fichier ainsi obtenu pourra être exploité comme expliqué dans
l'article [Sauver restaurer une
debian](sauver-restaurer-une-debian.hml "wikilink")

### LDAP

J'utilise slapd (openldap) comme serveur ldap, pour la sauvegarde de la
base au format ldif j'utilise les lignes de configuration suivante :

`BM_PIPE_COMMAND[0]="/usr/sbin/slapcat"`\
`BM_PIPE_NAME[0]="ldap"`\
`BM_PIPE_FILETYPE[0]="ldif"`\
`BM_PIPE_COMPRESS[0]="gzip"`

### Ejabberd

j'utilise ejabberd comme serveur jabber, pour la sauvegarde de la base
Mnesia, j'utilise :

`# Ejabberd`\
`BM_PIPE_COMMAND[0]="/usr/local/share/backups/bk_jabber"`\
`BM_PIPE_NAME[0]="ejabberd"`\
`BM_PIPE_FILETYPE[0]="dump"`\
`BM_PIPE_COMPRESS[0]="gzip"`

avec le script /usr/local/share/backups/bk\_jabber

`#!/bin/bash`\
`DUMP_FILE=$(mktemp)`\
`chown ejabberd $DUMP_FILE`\
`chmod 660 $DUMP_FILE`\
`ejabberdctl dump $DUMP_FILE`\
`cat $DUMP_FILE`\
`rm $DUMP_FILE`

### MySQL

la cible mysql ne permet pas de sauver simplement toutes les base avec 1
fichier par base.

`# MySQL`\
`BM_PIPE_COMMAND[0]="/usr/local/share/backups/bk_mysql"`\
`BM_PIPE_NAME[0]="mysql_one_file_by_base"`\
`BM_PIPE_FILETYPE[0]="tar"`\
`BM_PIPE_COMPRESS[0]="gzip"`

avec le script /usr/local/share/backups/bk\_mysql

`#!/bin/bash`\
`WORK_DIR=$(mktemp -d)`\
`LST_BASES=$(echo "SHOW DATABASES;" | /usr/bin/mysql -u root -p$BM_MYSQL_ADMINPASS |grep -v Database) `\
`for base in $LST_BASES`\
`do`\
`    /usr/bin/mysqldump -u root -p$BM_MYSQL_ADMINPASS --opt $base > $WORK_DIR/$base.sql`\
`done`\
`cd $WORK_DIR`\
`tar -c *.sql`\
`cd /tmp/`\
`rm -rf $WORK_DIR`

### Postgresql

sauvegarde de toutes les bases postgres avec 1 fichier par base

`# Postgresql`\
`BM_PIPE_COMMAND[0]="/usr/local/share/backups/bk_pgsql"`\
`BM_PIPE_NAME[0]="pgsql_one_file_by_base"`\
`BM_PIPE_FILETYPE[0]="tar"`\
`BM_PIPE_COMPRESS[0]="gzip"`

avec le script /usr/local/share/backups/bk\_pgsql

`#!/bin/bash`\
`WORK_DIR=$(mktemp -d)`\
`LST_BASES=$(su postgres -c "psql -l --no-align" | sed -e '1d' -e '2d' -e '$d' | cut -d '|' -f 1)`\
`for base in $LST_BASES`\
`do`\
`    /usr/bin/pg_dump -Fc -b $base > $WORK_DIR/$base.dump`\
`    /usr/bin/pg_dump -Fp -D $base > $WORK_DIR/$base.sql`\
`done`\
`cd $WORK_DIR`\
`tar -c *`\
`cd /tmp/`\
`rm -rf $WORK_DIR`

### FTPS

Par défaut il manque une dépendance pour faire du ftps (ftp over SSL)

`apt-get install libnet-lite-ftp-perl`

