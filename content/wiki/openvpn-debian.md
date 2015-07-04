+++
date = "2009-01-26"
draft = false
title = "OpenVpn Debian"
color = "pink"
icon = "male"
Tags = [ "mediawiki"]
description = "OpenVpn Debian"
+++

Quelques notes sur l'installation d'openvpn sous debian avec une
authentification pam

    apt-get install openvpn
    cd /usr/share/doc/openvpn/examples/easy-rsa/2.0
    mkdir /etc/openvpn/easy-rsa/
    cp vars /etc/openvpn/easy-rsa/

    vi /etc/openvpn/easy-rsa/vars
    export KEY_DIR=/etc/openvpn/keys
    ...
    export KEY_COUNTRY="FR"
    export KEY_PROVINCE="Nord"
    export KEY_CITY="Lille"
    export KEY_ORG="vpn.sharengo.org"
    export KEY_EMAIL="postmaster@sharengo.org"

    . /etc/openvpn/easy-rsa/vars
    ./clean-all

Construire le certificat racine

    ./build-ca

publication du certificat racine par le serveur web

    cp /etc/openvpn/keys/ca.crt /var/www/

Construction du fichier dh

    ./build-dh

Construire la paire de clé du serveur (vpn.sharengo.org)

    ./build-key-server  vpn.sharengo.org

    vi /etc/openvpn/vpn.sharengo.org.conf
    plugin /usr/lib/openvpn/openvpn-auth-pam.so common-auth
    client-cert-not-required

    /etc/init.d/openvpn restart
