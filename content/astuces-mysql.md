Title:Astuces Mysql
Date:2011-10-18
Tags:  mediawiki

Migrer une base de latin 1 en UTF-8
===================================

    MABASE=mabase
    mysqldump --add-drop-table -u root -p $MABASE > /tmp/$MABASE.sql  
    iconv -f latin1 -t utf8 /tmp/$MABASE.sql > /tmp/$MABASE.utf8.sql 
    sed -e 's/CHARSET=latin1/CHARSET=utf8/g' -i /tmp/$MABASE.utf8.sql
    mysql -u root -p $MABASE < /tmp/$MABASE.utf8.sql

Et voilà :-) dans certains cas, genre xwiki même si l'interclassement
est en latin1 les données sont déjà en UTF-8 donc pour ne pas déformer
les données il suffit de supprimer l'étape iconv.

Montrer les requêtes en cours
=============================

Je cherchais un "show query" alors qu'il faut lancer :

`mysql`\
`show processlist;`

