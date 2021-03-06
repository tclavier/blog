+++
date = "2012-06-29"
draft = false
title = "Astuces Bash"
color = "orange"
icon = "info-circle"
Tags = [ "mediawiki"]
description = "Astuces Bash"
+++

### Lock

ou comment créer un fichier de lock en bash

    LOCK_FILE=/var/run/$(basename $0).lock
    kill -0 $(cat $LOCK_FILE 2>/dev/null) 2> /dev/null
    if [ $? -eq 1 ]
    then
      echo $$ > $LOCK_FILE
    else 
      echo "process en cours"
      exit 1
    fi

Version courte :

    LOCK_FILE=/var/run/$(basename $0).lock
    kill -0 $(cat $LOCK_FILE 2>/dev/null) 2> /dev/null && exit 1 || echo $$ > $LOCK_FILE

### Substitution

ou comment éviter d'appeler sed. L'inconvénient c'est que ça ne
fonctionne que sur une variable et pas sur l'entrée standard. Si l'on a
:

    FOO="titi.toto"

La ligne

    FOO=$(echo $FOO| sed -e 's/toto/txt/g')

peut s'écrire

    FOO=${FOO/toto/txt}

Ce qui, il faut l'avouer, est beaucoup plus court.

### Progression

Comment afficher la progression d'un script bash en supposant que nous
ayons dans \$TOTAL le nombre total d'itérations :

    COUNT=0;
    for i in $(seq 1 $TOTAL)
    do
      #Process
      # ...
      COUNT=$(($COUNT + 1))
      DIV=$(echo "$COUNT % ($TOTAL / 100)" | bc )
      [ $DIV -eq 0 ] &&  echo  -e -n "\r$COUNT / $TOTAL"
    done
    echo -e "\r$TOTAL / $TOTAL"

### Ligne à ligne

    IFS_OLD=$IFS
    IFS=$'\n'
    for line in $(cat file)  
    do  
       ....
    done  
    IFS=$IFS_OLD 
