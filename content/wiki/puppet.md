+++
date = "2011-06-17"
draft = false
title = "Puppet"
color = "deep-purple"
icon = "save"
Tags = [ "mediawiki"]
description = "Puppet"
+++

Prise de note sur l'ajout d'une machine dans le "nuage" puppet

    grep search /etc/resolv.conf 
    search azae.net

    apt-get install puppet
    puppetd --test

Sur le master puppet

    puppetca --list
    puppetca --sign nom_de_machine
