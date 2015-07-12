+++
Description = "Comment activer la correction orthographique et grammaticale dans vim"
Tags = ["Vim", "shell"]
color = "light-blue"
date = "2015-07-12T15:05:33+02:00"
icon = "terminal"
title = "Orthographique et grammaire avec Vim"
draft = false
+++

Point de salut en dehors de Vim ... Enfin si mais ça reste quand même l'éditeur
de texte que j'utilise le plus. N'étant pas un féru d'orthographe, je cherchais
un outil plus intégré que [Scriben](http://www.scriben.com) pour mon Vim
préféré. C'est suite à la lecture de [Correction orthographique et grammaticale avec Vim](http://blog.fedora-fr.org/metal3d/post/Correction-orthographique-et-grammaticale-avec-Vim)
que j'ai configuré la correction Orthographique de vim et LanguageTool. Je
vous livre ici les quelques étapes à dérouler pour y arriver.

# Orthographe

Depuis quelque temps maintenant, la correction orthographique est native dans Vim.

Après avoir édité le fichier `~/.vimrc`

    syn spell toplevel
    set spelllang=fr
    noremap <F2> :set spell!<cr>:set spell?<cr> " pour mettre ou enlever la correction

Il suffit d'activer la correction orthographique native de vim avec la touche F2. À la première utilisation vim demande s'il faut télécharger les dictionnaires. En répondant oui à chaque question, on se retrouve avec les mots qui ne sont pas dans le dictionnaire surligné de rouge. 

Les commandes `]s` et `[s` permettent de sauter d'un mot en rouge à un autre tandis que `z=` liste une série d'alternatives au mot surligné et `zg` ajoute le mot courant dans le dictionnaire local. Pour le reste des commandes je vous invite à lire la documentation de [vim::spell](http://vimdoc.sourceforge.net/htmldoc/spell.html)

# Grammaire

[Grammalecte](http://www.dicollecte.org/grammalecte/) et [LanguageTool](https://languagetool.org/) sont deux projets de correcteurs grammaticaux lié au projet LibreOffice. Alors que le premier n'est qu'une extension, le second apporte une fonctionnalité fort intéressante : celle de pouvoir fonctionner en ligne de commande.

Commencez par télécharger le [plugin LanguageTool](http://www.vim.org/scripts/script.php?script_id=3223), placez vous dans votre répertoire `~/.vim` et le décompresser.

Téléchargez le jar de LanguageTool sur leur site, décompressez le dans un répertoire puis configurer Vim pour l'utiliser. Dans le fichier `~/.vimrc` ajoutez :

    let g:languagetool_jar='/chemin/vers/languagetool-commandline.jar'

## Utilisation

Lancer la correction avec la commande `:LanguageToolCheck` celà va ouvrir un second buffer avec la liste des corrections possible. L'ensemble des erreurs apparaissant surligné en rouge dans le buffer principale. 

Pour passer dans le buffer de correction j'utilise la commande `CTRL+w w`, depuis ce buffer listant toutes les erreurs, il suffit de taper `entrée` sur une erreur pour basculer dessus dans le buffer d'édition.
