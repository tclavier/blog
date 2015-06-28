+++
date = "2009-10-12"
draft = false
title = "Ulimit"
color = "green"
icon = "credit-card"
Tags = ["trucs et astuces", "mediawiki"]
description = "Ulimit"
+++

erreur rencontré dans tomcat : (Too many open files)

solution :

    grep tomcat /etc/security/limits.conf 
    tomcat soft nofile 32768
    tomcat hard nofile 50000
    tomcat soft nproc 8192
    tomcat hard nproc 16384

    grep limi /etc/pam.d/common-auth 
    session required    pam_limits.so

Sous gentoo, le fichier est */etc/pam.d/system-auth* au lieu de
*/etc/pam.d/common-auth*.
