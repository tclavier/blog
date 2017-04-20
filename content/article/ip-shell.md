+++
Categories = ["Development", "Shell"]
Description = ""
Tags = ["Development", "shell"]
color = ""
date = "2017-02-27T12:41:00+02:00"

icon = ""
title = "IP et shell"

+++

Quelques idées pour trouver son ip privé en shell : 

    ip route get 8.8.8.8| grep src| sed 's/.*src //g'

    hostname -I | cut -f 1 -d ' '

