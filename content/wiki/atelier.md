+++
date = "2008-05-29"
draft = false
title = "Atelier"
color = "orange"
icon = "gear"
Tags = [ "mediawiki"]
description = "Atelier"
+++

### Paramétrage d'une nouvelle cible de déploiement

-   interlocuteur : Argia,
-   action : modifier le projet dans svn

### Nouvelle version

-   interlocuteur : Argia, Bartek
-   action : nouveau tag

### Configuration Apache / Tomcat

-   interlocuteur : Ariga et Colt
-   action : modif de paramétrage dans le dépos puis réplication sur les
    serveurs

### Copie des bases

-   interlocuteur : Argia et colt
-   action : dump des bases france ou vide puis création des bases et
    chargement. Changement des droits sur les objets psql

<!-- -->

    pg_dump -U postgres -d atelier-content-lmfr -Fc > /tmp/atelier-content-lmfr.dump
    pg_dump -U postgres -d atelier-roller -Fc > /tmp/atelier-roller.dump
    pg_dump -U postgres -d mvnforum-atelier -Fc > /tmp/mvnforum-atelier.dump

    psql -U postgres -l
    createdb -U postgres atelier-roller-it
    createdb -U postgres mvnforum-atelier-it
    createuser -U postgres -P lmituser
    pg_restore -U postgres -d atelier-content-lmit -Fc /tmp/atelier-content-lmfr.dump
    pg_restore -U postgres -d atelier-roller-it -Fc /tmp/atelier-roller.dump
    pg_restore -U postgres -d mvnforum-atelier-it -Fc /tmp/mvnforum-atelier.dump
    cat grantall.sh
    ./grantall.sh atelier-content-lmit lmituser
    ./grantall.sh atelier-roller-it lmituser
    ./grantall.sh mvnforum-atelier-it lmituser

### Copie de statiques

    cd /srv/lm/
    ls
    cp -a pt it
    cd it/
    ls
    mv atelier.leroymerlin.pt atelier.leroymerlin.it
    ls
    cd atelier.leroymerlin.it
    ld
    cd /srv/lm/it/atelier.leroymerlin.it/
    ls
    cd webapps/
    ls

### Déploiement

-   action : récupérer les war sur le serveur de build et le déposer
    dans /srv/lm/PAYS/atelier.leroymerlin.PAYS/webapps/

relance apache / tomcat

    wget http://build.argia.fr/luntbuild/publish/mpng2-atelier-lmfr/mpng2-atelier-lmfr-2.7-RC3/mpng2-atelier-lmfr-2.7-RC3/artifacts/deployment/pv5-it/server/mpng2-atelier-lmfr-tags-mpng2-atelier-lmfr-2.7-RC3.war -O mpng2-front.war
    ls
    rm -rf mpng2-front
    rm -rf website-workshop-lmpt
    ls
    mv website-workshop-lmpt.war website-workshop-lmit.war
    ls
    cd roller
    grep -r lmpt *
    vi META-INF/context.xml
    ls
    cd ../
    cd mvnforum
    grep -r lmpt *
    cd ../
    cd roller
    vi META-INF/context.xml
    cd -
    cd mvnforum
    vi WEB-INF/classes/mvncore.xml
    cd ../
    ls
    /etc/init.d/apache restart
    /etc/init.d/tomcat restart
