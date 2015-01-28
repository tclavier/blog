Title:SSL avec CAcert.org
Date:2011-10-12
Tags:  mediawiki

Comme le titre le laisse pensé, j'utilise CAcert.org comme tiers de
confiance. Pour Installer de nouveaux certificats, voici ce que je fais.

-   génération de la paire de clés :

`HOST=tcweb.org`\
`openssl genrsa -out $HOST.key 2048`\
`openssl req -new -key $HOST.key -out $HOST.csr`

-   aller sur le site de CAcert.org y copier coller le contenu du
    fichier .csr, le résultat sera enregistré dans un fichier .cert
-   pour certaines applications il faut concaténer la clé et le
    certificat dans un même fichier pem

`cat $HOST.key $HOST.cert > $HOST.pem`

-   copier le certificat racine de CACcert.org sur votre disque. Sous
    debian installer le paquet ca-certificates

`apt-get install ca-certificates`

### Apache

    <VirtualHost *:443>
        SSLEngine On
        SSLCertificateFile      /etc/ssl/certs/webmail.cert
        SSLCertificateKeyFile   /etc/ssl/private/webmail.key
        SSLCACertificatePath    /etc/ssl/certs

### OpenLDAP

#### Côté serveur

Il faut modifier le fichier slapd.conf :

`TLSCACertificateFile /etc/ssl/certs/ca-certificates.crt`\
`TLSCertificateKeyFile /etc/ldap/ssl/ldap.key`\
`TLSCertificateFile /etc/ldap/ssl/ldap.cert`

modifier le fichier etc/default/slapd :

`SLAPD_SERVICES="`[`ldaps:///`](ldaps:///)`"`

et mettre les bon droits sur le fichier de clé privé :

`chmod 600 /etc/ldap/ssl/ldap.key`\
`chown openldap /etc/ldap/ssl/ldap.key`

#### Côté client

modifier le fichier ldap.conf :

`TLS_CACERT /etc/ssl/certs/ca-certificates.crt`\
`TLS_REQCERT  demand`

### Exim4

dans le fichier main/03\_exim4-config\_tlsoptions

`MAIN_TLS_CERTKEY = /etc/ssl/private/smtp.tcweb.key`\
`MAIN_TLS_CERTIFICATE = /etc/ssl/certs/smtp.tcweb.cert`

### ejabberd

dans le fichier ejabberd.cfg remplacer toutes les occurrences de
/etc/ejabberd/ejabberd.pem par /etc/ssl/private/jabber.tcweb.pem

Attention, une grande quantité de client jabber n'ont pas le certificat
racine de niveau 3 de CACert

### Courier-imap-ssl

dans le fichier /etc/courier/imapd-ssl on trouve :

`TLS_CERTFILE=/etc/courier/imap.tcweb.org.pem`

### Mysql

dans le fichier /etc/mysql/my.cnf

`ssl-ca=/etc/ssl/certs/ca-certificates.crt`\
`ssl-cert=/etc/mysql/$HOST.pem`

