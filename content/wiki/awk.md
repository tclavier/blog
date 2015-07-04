+++
date = "2011-03-18"
draft = false
title = "Awk"
color = "purple"
icon = "krw"
Tags = ["trucs et astuces", "mediawiki"]
description = "Awk"
+++

L'équivalent d'un group by count en awk :

    awk '{ add[$1]++} END{for (no in add) {print no", "add[no]}}'

idem avec une somme du paramètre \$4

    awk '{ add[$1]++; sum[$1]=sum[$1]+$4 } END { for( no in add) { print no"\t"sum[no]"\t"add[no] }}'

ne pas hésiter à réordonner les print pour "tuber" ça dans un sort -n
