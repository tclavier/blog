+++
date = "2011-06-09"
draft = false
title = "Ssh"
color = "deep-purple"
icon = "plus"
Tags = [ "mediawiki"]
description = "Ssh"
+++

Quelques astuces ssh

Une prison sftp
---------------

/etc/ssh/sshd\_config

    Subsystem       sftp    internal-sftp
     
    Match Group ftpusers
             ChrootDirectory /home/%u
             ForceCommand internal-sftp
             AllowTCPForwarding no
             X11Forwarding no

ajouter un user

    adduser foo
    adduser foo ftpusers
    chown root:root ~foo
    mkdir ~foo/ftp
    chown foo:foo ~foo/ftp
