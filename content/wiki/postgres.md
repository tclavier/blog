+++
date = "2011-06-09"
draft = false
title = "Postgres"
color = "yellow"
icon = "pinterest-p"
Tags = [ "mediawiki"]
description = "Postgres"
+++

Quelques astuces postgresql :

Copy une base sur un autre host à travers ssh :

    HOST=machine2
    DB=madb
    ssh $HOST "pg_dump -U postgres -d $DB -Fc" | pg_restore -Fc -U postgres -c -d $DB
