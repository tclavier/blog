Title:Dropbear sshfs
Date:2008-08-10
Tags: Trucs et astuces, Linux,  mediawiki

sur mon nslu2 tournant sous debian, j'ai été confronté à un petit
problème de Ram. Faut dire que la bête n'embarque que 32M de Ram donc
pour économiser de l'espace j'ai remplacer openssh-server par dropbear
... sauf que ho malheur, sshfs ne fonctionnais plus, je trouvais ça dans
les logs :

` dropbear[5457]: exit before auth: Exited normally`

après de nombreuses recherches sur la toile j'en arrive à la conclusion
suivante sshfs utilise sftp et dropbear n'implémente pas sftp. Mais
juste pour sftp, dois je sacrifier 7M de ram ? et oui, l'empreinte
mémoire d'openssh avoisine les 8M de ram alors que dropbear n'en fait
qu'un.

la solution est toute simple, j'ai installé openssh-server donc le
composant sftp avec et j'ai désactivé le démon openssh. Pour ça, il
suffit de faire un simple

`apt-get install openssh-server`\
`touch /etc/ssh/sshd_not_to_be_run`

et voilà sshfs refonctionne ... et cette fois avec dropbear !

