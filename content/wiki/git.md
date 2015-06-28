+++
date = "2013-09-23"
draft = false
title = "Git"
color = "yellow"
icon = "legal"
Tags = [ "mediawiki"]
description = "Git"
+++

Comment installer un serveur git avec un minimum de sécurité qui
présente les projets en ssh, git et http sous debian.

Gitolite
--------

    scp ~/.ssh/id_rsa.pub serveur:/tmp/admin.pub
    ssh serveur
    apt-get install gitolite
    dpkg-reconfigure gitolite

modifier la conf gitolite

    chmod 755 /var/lib/gitolite/repositories/
    vi /var/lib/gitolite/.gitolite.rc
    ...
    $REPO_UMASK = 0022;
    ...

Maintenant gitolite est installé et configuré.

git-daemon
----------

    apt-get install git-daemon
    
    vi /etc/default/git-daemon
    GIT_DAEMON_USER=gitolite
    GIT_DAEMON_DIRECTORY=/var/lib/gitolite/repositories/
    GIT_DAEMON_BASE_PATH=/var/lib/gitolite/repositories/
    
    /etc/init.d/git-daemon restart

Pour rentre un dépôt lisible publiquement à travers le protocole git

    touch /var/lib/gitolite/repositories/mon_projet.git/git-daemon-export-ok

gitweb
------

    apt-get install gitweb

    vi /et/gitweb.conf
    $projectroot = "/var/lib/gitolite/repositories/";
