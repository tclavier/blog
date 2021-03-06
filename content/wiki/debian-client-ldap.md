+++
date = "2009-06-23"
draft = false
title = "Debian client LDAP"
color = "yellow"
icon = "dot-circle-o"
Tags = ["trucs et astuces","linux", "mediawiki"]
description = "Debian client LDAP"
+++

quelques notes pour configurer une machine debian comme client d'un
serveur LDAP.

     apt-get install libnss-ldapd libpam-ldap nscd ca-certificates libpam-foreground

répondre aux questions :

-   URI : <ldaps://ldap.tcweb.org>
-   DN : dc=tcweb,dc=org
-   LDAP : V3
-   compte admin : cn=admin,dc=tcweb,dc=org
-   mot de passe admin : XXXXXXXX
-   activer le ldap pour : passwd, group et shadow

pour les autres questions, prendre la réponse par défaut

puis modifier les fichiers pam suivant :

-   /etc/pam.d/common-account

    account sufficient pam_ldap.so
    account required pam_unix.so
    #if you want user homedir to be created on first login
    session required pam_mkhomedir.so umask=0022 skel=/etc/skel/ silent  

-   /etc/pam.d/common-auth

    auth sufficient pam_ldap.so
    auth required pam_unix.so nullok_secure use_first_pass 

-   /etc/pam.d/common-password

    password sufficient pam_ldap.so
    password required pam_unix.so nullok obscure min=4 max=8 md5 

-   /etc/pam.d/common-session

    session sufficient pam_ldap.so
    session required pam_unix.so
    session optional pam_foreground.so

le fichier /etc/ldap/ldap.conf

    BASE    dc=tcweb, dc=org
`URI     `[`ldaps://ldap.tcweb.org`](ldaps://ldap.tcweb.org)\
    TLS_CACERT /etc/ssl/certs/ca-certificates.crt
    TLS_REQCERT demand

Tester
------

Tester la connection SSL :

    openssl s_client -host ldap.tcweb.org -port 636 -CAfile /etc/ssl/certs/ca-certificates.crt

Tester le server ldap

    ldapsearch -x -v 
`ldapsearch -x -v -H '`[`ldaps://ldaps.tcweb.org`](ldaps://ldaps.tcweb.org)`'`

Tester la bonne configuartion de PAM et libnss

    getent passwd
