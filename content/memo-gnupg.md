Title:Mémo GnuPG
Date:2007-05-16
Tags:  mediawiki

Créer une clé :

` gpg --gen-key`

Exporter une clé publique

` gpg --export -a "User Name" > public.key`

Cela va créer un fichier public.key facilement échangeable avec le reste
du monde.

Exporter une clé privé

` gpg --export-secret-key -a "User Name" > private.key`

Cela va créer un fichier private.key. Attention à ne pas publier ce
fichier.

Importer la clé publique présente dans le fichier public.key à votre
porte clé

` gpg --import public.key`

Importer une clé privé

` gpg --allow-secret-key-import --import private.key`

Effacer une clé publique du trousseau :

` gpg --delete-key "User Name"`

Attention, cela n'efface pas la clé des serveurs pgp

Effacer une clé privé :

` gpg --delete-secret-key "User Name"`

Afficher la liste des clés publiques présente dans le trousseau :

` gpg --list-keys`

Afficher la liste des clés privés présente dans le trousseau :

` gpg --list-secret-keys`

Générer le "finguerprint", l'emprunte lisible d'une clé

` gpg --fingerprint ID_DE_LA_CLE`

Editer une clé pour par exemple ajouter un mail :

` gpg --edit-key`

Générer un certificat de révocation d'une clé

` gpg --gen-revoke`

