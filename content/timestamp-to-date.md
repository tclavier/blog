Title:Timestamp to Date
Date:2007-04-06
Tags: Linux, Trucs et astuces,  mediawiki

Ou comment en ligne de commande convertir un timestamp unix en date.

Avec Perl :

` TIMESTAMP=1173279767`\
` perl -e "print scalar(localtime($TIMESTAMP))"`

Avec Perl et module ctime :

` TIMESTAMP=1173279767`\
` perl -e "require 'ctime.pl'; print &ctime($TIMESTAMP);"`

En shell avec awk :

` echo 1173279767 | awk '{print strftime("%c",$1)}'`

En shell avec date :

` TIMESTAMP=1173279767`\
` date -d "1970-01-01 $TIMESTAMP sec GMT"`

