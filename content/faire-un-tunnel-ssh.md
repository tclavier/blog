Title:Faire un tunnel ssh
Date:2006-09-25
Tags: trucs et astuces,  mediawiki

Comment établir simplement une liaison sécurisée entre deux machines,
sans avoir à configurer un VPN ? Comment passer tout un tas de
protocoles à travers un firewall de manière sécurisé ?

Réponse : tout simplement, en établissant un tunnel SSH entre la machine
locale et la machine distante.

` ssh -L `<port local>`:`<machine cible>`:`<port cible>` `<machine distante>

Tout le traffic dirigé vers <machine locale>:<port local> sera alors
"SSH-tunnellé" vers <machine cible>:<port cible>. Attention, la liaison
n'est sécurisé qu'entre <machine locale> et <machine distante>, et
transite en claire de <machine distante> à <machine cible>. Remarquez
que pour que cela fonctionne, il faut bien sûr, qu'un démon sshd tourne
sur <machine distante>

Il est possible d'automatiser un tunnel ssh en ajoutant une ligne de ce
style dans le fichier de configuration de ssh (\~/.ssh/config):

` LocalForward `<port local>` `<machine cible>`:`<port cible>

ce qui chez moi donne ça :

      Host tcweb.org
        User tom                             // Pour Utiliser un nom d'utilisateur différent de celui d'ici
        LocalForward 993 localhost:993       // Pour avoir accès à mon propre serveur IMAPS
        LocalForward 119 news.free.fr:119    // Pour avoir accès au serveur de news de free

![](Tunnels putty.png "fig:Tunnels putty.png") Dans
[PuTTY](putty.hml "wikilink"), la configuration est graphique. Commencez par
chercher dans le menu de gauche l'entrée "Connection-\>SSH-\>Tunnels".
C'est ici que vous allez pouvoir ajouter chaque tunnel. N'oubliez pas de
cliquer sur "Add".

Pour passer du ssh à travers un proxy, je vous invites à lire l'article
[Traverser un proxy](traverser-un-proxy.hml "wikilink") et à regardez du
côté de [Corkscrew](corkscrew.hml "wikilink"),
[httptunnel](httptunnel "wikilink"). Certains clients graphique comme
[PuTTY](putty.hml "wikilink") ou [Filezilla](filezilla.hml "wikilink"),
l'intègre en natif.

