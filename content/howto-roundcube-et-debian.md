Title:HowTo RoundCube et debian
Date:2007-09-20
Tags: Trucs et astuces,Linux,  mediawiki

Mode opératoire pour installer la version svn de
[RoundCube](http://roundcube.net/) sur une debian (etch, lenny ou sid).
Celà doit aussi fonctionner avec d'autres distributions.

Depuis le 04/05/2007 un [paquet
roundcube](http://packages.debian.org/roundcube) officiel à fait sont
entrée dans debian sid, 1 mois plus tard il est entré dans testing. Il
est fortement conseillé d'utiliser la version empaqueté présente dans
les dépos debian officiel. Le seule intérêt de suivre la procédure
ci-dessous, c'est d'utiliser la version subversion.

Récupération des sources de roundcube directement dans le svn

`cd /usr/local/share`\
`svn checkout `[`https://svn.roundcube.net/trunk/roundcubemail`](https://svn.roundcube.net/trunk/roundcubemail)` roundcube`

Création et préparation du répertoire de travaille, dans la "debian
policy" les applications web doivent travailler dans
/var/lib/mon\_applie

`mkdir -p /var/lib/roundcube/temp`\
`chown www-data:www-data /var/lib/roundcube/temp`\
`cd /var/lib/roundcube`\
`ln -s /usr/local/share/roundcube/bin /usr/local/share/roundcube/index.php \`\
`      /usr/local/share/roundcube/program /usr/local/share/roundcube/skins \`\
`      /usr/local/share/roundcube/.htaccess .`

Création de la base de données

`mysql -u root -p`\
`> create database roundcubemail;`\
`> GRANT ALL PRIVILEGES ON roundcubemail.* TO roundcube@localhost IDENTIFIED BY 'password';`\
`> quit`

Chargement de la base

`mysql -u root -p roundcubemail < /usr/local/share/roundcube/SQL/mysql5.initial.sql`

Préparer le répertoire de configuration, dans debian, la totalité des
fichiers de configuration doivent se trouver dans /etc/

`mkdir /etc/roundcube`\
`ln -s /etc/roundcube /var/lib/roundcube/config`\
`cp /usr/local/share/roundcube/config/db.inc.php.dist /etc/roundcube/db.inc.php`\
`cp /usr/local/share/roundcube/config/main.inc.php.dist /etc/roundcube/main.inc.php`\
`chown www-data:www-data /etc/roundcube/db.inc.php /etc/roundcube/main.inc.php`\
`chmod 640 /etc/roundcube/db.inc.php /etc/roundcube/main.inc.php`

Configurer RoundCube, voir [le site de
roundcube](http://trac.roundcube.net/trac.cgi/wiki/Howto_Install) pour
plus d'informations

`vi /etc/roundcube/db.inc.php`\
`vi /etc/roundcube/main.inc.php`

Configurer les logs

`mkdir /var/log/roundcube`\
`chown www-data:www-data /var/log/roundcube`\
`ln -s /var/log/roundcube /var/lib/roundcube/logs`

Configurer Apache2, voir l'exemple de fichier de configuration en fin
d'article

`vi /etc/apache2/sites-available/roundcube`\
`a2ensite roundcube`\
`invoke-rc.d apache2 reload`

Configurer logrotate pour une rotation intelligente des logs :

`vi /etc/logrotate.d/roundcube`

Exemple de fichier /etc/logrotate.d/roundcube

    /var/log/roundcube/errors  /var/log/roundcube/sendmail {
            daily
            missingok
            rotate 10
            compress
            delaycompress
            notifempty
            create 640 www-data www-data
    }

Exemple de fichier /etc/apache2/sites-available/roundcube

    <VirtualHost *:80>
      DocumentRoot /var/lib/roundcube
      ServerName webmail.tcweb.org
      ServerAlias webmail.tcweb.fr
      ServerAlias webmail.tcweb.eu

    # redirect to https when available (thanks omen@descolada.dartmouth.edu)
    #
    #  Note: There are multiple ways to do this, and which one is suitable for
    #  your site's configuration depends. Consult the apache documentation if
    #  you're unsure, as this example might not work everywhere.
    #
    <IfModule mod_rewrite.c>
      <IfModule mod_ssl.c>
        <Location />
          RewriteEngine on
          RewriteCond %{HTTPS} !^on$ [NC]
          RewriteRule . https://%{HTTP_HOST}%{REQUEST_URI}  [L]
        </Location>
      </IfModule>
    </IfModule>

    </VirtualHost>

    # Le vhost en https
    <VirtualHost *:443>
      DocumentRoot /var/lib/roundcube
      ServerName webmail.tcweb.org
      ServerAlias webmail.tcweb.fr
      ServerAlias webmail.tcweb.eu

      SSLEngine on
      SSLCertificateFile /etc/apache2/ssl/tcweb.org.pem
    </VirtualHost>
