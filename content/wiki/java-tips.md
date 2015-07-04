+++
date = "2011-02-11"
draft = false
title = "Java tips"
color = "amber"
icon = "male"
Tags = [ "mediawiki"]
description = "Java tips"
+++

Utilisation réel de la mémoire par un process java :

`jstat -gc 11136 | tail -n 1 | sed -e 's/^`$[0-9]*.[0-9]$`\s*`$[0-9]*.[0-9]$`\s*`$[0-9]*.[0-9]$`\s*`$[0-9]*.[0-9]$`\s*`$[0-9]*.[0-9]$`\s*`$[0-9]*.[0-9]$`\s*`$[0-9]*.[0-9]$`\s*`$[0-9]*.[0-9]$`\s*`$[0-9]*.[0-9]$`\s*`$[0-9]*.[0-9]$`\s*.*$/(\3 + \4 + \6 + \8 + \10)\/ 1024 /' | bc`
