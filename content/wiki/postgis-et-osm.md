+++
date = "2012-08-04"
draft = false
title = "Postgis et OSM"
color = "indigo"
icon = "th-large"
Tags = [ "mediawiki"]
description = "Postgis et OSM"
+++

quelques notes sur l'installation des données france osm (openstreetmap)
dans une base postgres.

    apt-get install postgresql-8.4-postgis osm2pgsql
    apt-get install postgresql-9.1-postgis osm2pgsql

    vi /etc/postgresql/8.4/main/postgresql.conf
    shared_buffers = 128MB  
    checkpoint_segments = 20

    vi /etc/sysctl.conf
    kernel.shmmax = 268435456

    su - postgres 
    createuser osm
    createdb -E UTF8 -O osm osm
    createlang plpgsql osm
    psql -d osm -f /usr/share/postgresql/8.4/contrib/postgis-1.5/postgis.sql
    psql -d osm -f /usr/share/postgresql/9.1/contrib/postgis-1.5/postgis.sql
    echo "ALTER TABLE geometry_columns OWNER TO osm; ALTER TABLE spatial_ref_sys OWNER TO osm;"  | psql -d osm
`wget `[`http://svn.openstreetmap.org/applications/utils/export/osm2pgsql/900913.sql`](http://svn.openstreetmap.org/applications/utils/export/osm2pgsql/900913.sql)` && psql -f 900913.sql osm`

osm peut maintenant lancer

`wget `[`http://download.geofabrik.de/osm/europe/france.osm.bz2`](http://download.geofabrik.de/osm/europe/france.osm.bz2)\
    psql -d osm -f /usr/share/doc/osm2pgsql/examples/900913.sql
    osm2pgsql -s -m -d osm france.osm.bz2
    
`wget `[`http://planet.openstreetmap.org/planet-latest.osm.bz2`](http://planet.openstreetmap.org/planet-latest.osm.bz2)

Pour les minutes diff

    apt-get install postgresql-contrib
    su - postgres
    psql -d gis -f /usr/share/postgresql/8.4/contrib/_int.sql

installer mapnik

    apt-get install mapnik-utils python-mapnik libmapnik-dev

pour le rendu :

`svn checkout `[`http://svn.openstreetmap.org/applications/rendering/mapnik`](http://svn.openstreetmap.org/applications/rendering/mapnik)\
    cd mapnik
    ./get-coastlines.sh
    ./generate_xml.py --dbname gis --host 'localhost' --user tom --port 5432 --password ''
    ./generate_xml.py osm.xml gis.xml --dbname gis  --accept-none

    apt-get install apache2-prefork-dev devscripts dpatch apache2-mpm-prefork
`svn co `[`http://svn.openstreetmap.org/applications/utils/mod_tile`](http://svn.openstreetmap.org/applications/utils/mod_tile)\
    cd mod_tile 
    dpkg-buildpackage
    dpkg -i renderd_0.3_amd64.deb
    dpkg -i libapache2-mod-tile_0.3_amd64.deb
    a2enmod tile

s'inspirer du fichier mod\_tile.conf pour ajouter un vhost dédié

Sources :

-   <http://wiki.openstreetmap.org/wiki/Mapnik/PostGIS>
-   <http://wiki.openstreetmap.org/wiki/FR:Mapnik>
-   <http://wiki.openstreetmap.org/wiki/Planet.osm#Extracts>

Stats
-----

lxc sur dedibox pro R210

    time osm2pgsql -S mapnik/Beciklo/style/Becyklo.style -G -s -v -m -d  osm  -C 10240 france.osm.bz2
    real    267m42.023s
    user    99m22.381s
    sys     5m38.741s
