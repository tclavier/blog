+++
date = "2006-12-18"
draft = false
title = "Memo Oracle"
color = "green"
icon = "signal"
Tags = [ "mediawiki"]
description = "Memo Oracle"
+++

### stopper un base oracle

     sqlplus "/ as sysdba"
     shutdown

si ça marche pas

     shutdown abort

booter une base

     sqlplus "/ as sysdba"
     startup
