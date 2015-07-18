+++
Description = "Le culte des chiffres fait faire des choses extraordinaire, exemple avec une fausse bonne idée pour traiter le problème du spam referer"
Tags = ["seo"]
color = "lime"
date = "2015-07-16T22:04:14+02:00"
icon = "globe"
title = "Pourquoi ? Pourquoi ? Pourquoi ?"

+++

Je m'occupe de l'administration système de quelques serveurs pour des clients de la région, et l'autre jour j'ai eu une demande surprenante. Il fallait interdire l'accès au site à certains visiteurs sous prétexte qu'ils viennent d'une liste arbitraire de sites. L'argument avancé était un problème de spam referer.

# Spam referer

Durant un connections HTTP pour demander une ressource, le client peut annoncer au serveur quelle est la page qui l'amène à demander cette ressource. Certains sites pour augmenter le nombre de liens sortant ont décidés en s'appuyant sur cette propriété de rajouter automatiquement tous les liens pointant vers leurs pages ... Seulement des petits malins ont décidés d'exploiter ce comportement pour établir des liens vers leurs sites. Pour se faire, il utilise des robots qui font des requêtes vers divers sites en prétendant venir depuis chez eux. Avec un peu de chance certains publieront en automatique des liens vers leurs sites. 

# Notre cas
Bien conscient de l'existence de ce problème, je me suis demandé s'il n'était pas plus judicieux d'arrêter la publication de ces liens retours, ou de les modérer ? 
Après échange avec le webmaster, je découvre que ces liens n'ont jamais été publiés.  On peut donc imaginer que c'est pour éviter que les robots ne consomme trop de ressources et empêchent ainsi les vrais clients de visiter ? Mais les serveurs ne font quasiment rien, on pourrait multiplier le trafic par 20 ou 30 sans risque. 

On m'a expliqué que ça perturbe les chiffres, le taux de rebond des gens qui viennent de DuckDuckGo et Ask est bien trop gros, donc nous allons leur interdire de visiter le site. Certes, ce ne sont pas la majorité, mais quand même, ce ne serait pas mieux d'aller rencontrer ces personnes et d'apprendre pourquoi il ne reste pas ? À la limite les ignorer plutôt que de leur refuser l'accès ? 
Pour moi c'est aussi choquant que de refuser l'entrée d'un magasin à une minorité sous prétexte que statistiquement ils n'achètent pas suffisamment. 
Poussé à l'extrême, on pourrait interdire l'accès au magasin à toute personne qui n'est pas sûr de vouloir acheté ? Avec un taux de 100% on pourrait affirmer haut et fort, je contente tous mes clients !

Alors je n'ai peut-être rien compris, peut-être que le problème n'est pas là et qu'il justifie largement le fait de bannir des clients potentiels. Donc Si toi aussi visiteur d'un jour, tu comprends la recommandation, explique-moi pourquoi !

# La cause d'origine

Vous connaissez probablement la règle des 5 pourquoi, elle permet de revenir à la cause d'origine d'un problème. En se focalisant sur cette cause originelle, la résolution est souvent beaucoup plus efficace.

- Pourquoi mes chiffres sont mauvais ? 
- Parce que les visiteurs qui viennent de X ou de Y ne reste pas.

Dans l'exemple que je vous rapporte, j'ai le sentiment que l'on ne cherche pas plus loin. Pour avoir de bons chiffres, il suffit de bannir les gens qui viennent de X et de Y. 

- Mais pourquoi ces gens ne reste pas ? Pourquoi ne trouvent-ils pas ce qu'ils cherchent ? 
- Pourquoi les autres restent ? 

Voilà quelques questions qui pour l'instant restent sans réponse. Une fois les réponses trouvées, il faudra probablement se poser un ou deux nouveaux pourquoi avant de corriger la véritable origine du problème.
