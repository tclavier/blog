Title:Ezmlm-idx toute une histoire
Date:2007-12-06
Tags: Linux,  mediawiki

après avoir compilé un netqmail avec quelaues difficultés, me voilà
confronté au problème d'ezmlm ...

première erreur :

    /usr/bin/ld: errno: TLS definition in /lib/libc.so.6 section .tbss mismatches non-TLS reference in substdio.a(substdo.o)
    /lib/libc.so.6: could not read symbols: Bad value

en regardant de près le patch netqmail, on voit qu'il utilise errno.h du
système et pas les déclarations interne ... j'ai donc modifier le
conf-cc comme ceci :

` cc -O2 -include /usr/include/errno.h`

seconde erreur :

    ezmlm-return.c: In function ‘main’:
    ezmlm-return.c:258: warning: incompatible implicit declaration of built-in function ‘log’
    ezmlm-return.c:258: error: incompatible type for argument 1 of ‘log’
    ezmlm-return.c:258: error: too many arguments to function ‘log’
    ezmlm-return.c:259: warning: incompatible implicit declaration of built-in function ‘_exit’
    ezmlm-return.c:291: warning: incompatible implicit declaration of built-in function ‘_exit’
    ezmlm-return.c:309: warning: incompatible implicit declaration of built-in function ‘_exit’
    ezmlm-return.c:363: warning: incompatible implicit declaration of built-in function ‘_exit’
    ezmlm-return.c:185: warning: return type of ‘main’ is not ‘int’

là le problème est claire, la fonction log utilisé est celle du log.c
qui permet d'écrire dans les logs, or là il veut utiliser la fonction
log de "maths" le logarithme. Il faut donc ajouter un

`#include "log.h" `

dans le fichier ezmlm-return.c, et compléter le log.h pour que la
déclaration soit plus claire

`extern void log(char *event, char *addr);`

et voilà, la compilation puis l'installation devrait bien se terminer

`make`\
`make man`\
`make setup`

