+++
date = "2011-03-28"
draft = false
title = "Ruby on Rails"
color = "red"
icon = "plane"
Tags = [ "mediawiki"]
description = "Ruby on Rails"
+++

Quelques notes sur ruby on rails, certains éléments sont spécifique à ma
debian ...

Installation
------------

Sous debian

     gem install rails

provoque l'erreur suivante :

    ERROR:  While generating documentation for builder-2.1.2

Pour supprimer toutes les gems du système :

    for gem in $(gem list | awk '{print $1}'); do sudo gem uninstall $gem; done

Puis install de rdoc avant rails

    gem install rdoc
    gem install rails

et là pas d'erreur

Autre solution, installer sans doc :

    gem install rails --no-ri --no-rdoc
