+++
date = "2006-08-07"
draft = false
title = "Mirroir Ubuntu"
color = "amber"
icon = "paste"
Tags = ["linux","trucs et astuces", "mediawiki"]
description = "Mirroir Ubuntu"
+++

Voici un petit script pour faire un mirroir ubuntu :

    #!/bin/sh

    DESTINATION=ubuntu
    SERVEURSOURCE=fr.archive.ubuntu.com
    DEBMIRROR_OPT="--host=$SERVEURSOURCE  --arch=i386 --nosource --method=rsync --root=:ubuntu --section=main,multiverse,restricted,universe --getcontents --progress "
    DIST=dapper
    DISTS="$DIST $DIST-security $DIST-backports $DIST-proposed $DIST-updates"

    for dist in $DISTS
    do
            echo "Miroir de $dist"
            debmirror $dist $DEBMIRROR_OPT --dist=$dist
    done

script à lancer dans le répertoire de destination
