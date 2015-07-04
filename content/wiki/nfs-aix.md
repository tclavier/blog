+++
date = "2007-04-10"
draft = false
title = "Nfs AIX"
color = "brown"
icon = "exchange"
Tags = [ "mediawiki"]
description = "Nfs AIX"
+++

sur machineA

     exportfs -i -o root=machineB /toto/tata

sur machineB

     mount machineA:/toto/tata /point/de/montage
