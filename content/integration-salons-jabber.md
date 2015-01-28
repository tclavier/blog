Title:Intégration salons jabber
Date:2008-10-31
Tags:  mediawiki

Intégration des salons jabber sur une site web
==============================================

Pour proposer à vos visiteurs la possibilité de participer aux
discutions de groupe je vous propose l'intégration de Muckl sur votre
site.

Popup
-----

Pour l'ajouter dans une popup ajouter le formulaire suivant sur votre
site :

    <form method="get" action="http://direct.tcweb.org/muckl/muckl.html"
      target="chat" onSubmit="window.open ('about:blank','chat','width=600,height=300,toolbar=0,menubar=0,location=0,directories=0,status=0')">
        <input type="texte" name="nick" value="Pseudo" onFocus="if (this.value=='Pseudo') this.value=''">
        <input type="submit" value="Se connecter">
        <input type="hidden" name="room" value="0">
    </form>";

-   le onSubmit sur le formulaire va permettre de créer la popup avant
    de faire appel à la page.
-   le onFocus sur le nick permet de pré-alimenter le champs avec le
    libellé "Pseudo"

celà va ouvrir dans une popup l'url suivante :
<http://direct.tcweb.org/muckl/muckl.html?nick=pseudo&room=0>

On peut observer 2 paramètres passés en GET

-   nick : le pseudo du participant
-   room : le numéro du salon (0 pour chat@conference.lmbc.fr)

iframe
------

Pour l'avoir dans une iframe vous pouvez utiliser le code suivant :

` `<iframe src="http://direct.tcweb.org/muckl/" width="640" height="480"/>

client jabber
-------------

Vous pouvez aussi inviter vos visiteurs à utiliser un client jabber
classique comme
[Gajim](http://wiki.jabberfr.org/Jabber_en_dix_minutes_avec_Gajim) ou
[Psi](http://wiki.jabberfr.org/Jabber_en_dix_minutes_avec_Psi)

