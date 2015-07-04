+++
date = "2007-10-22"
draft = false
title = "Sauver un domU"
color = "deep-orange"
icon = "outdent"
Tags = [ "mediawiki"]
description = "Sauver un domU"
+++

    FILE=$(echo "$(hostname)./etc.$(date +%Y%m%d-%H%M).tar.bz2" | sed -e 's?/?.?g' -e 's/\.\./\./g')
    DEST_DIR="~/save/"
    DEST_HOST=nslu
    DEST_USER=tom
    tar -cjv  /etc/ | ssh $DEST_USER@$DEST_HOST "cat - >  $DEST_DIR$FILE"
