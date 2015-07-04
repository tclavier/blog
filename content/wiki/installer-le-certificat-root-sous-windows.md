+++
date = "2007-07-20"
draft = false
title = "Installer le certificat root sous windows"
color = "light-blue"
icon = "compass"
Tags = ["documentation tcweb", "mediawiki"]
description = "Installer le certificat root sous windows"
+++

*Je n'ai plus de windows sous la main, et j'ai perdu les images d'écran
... si vous avez le courage de les faire, je vous en serait
reconnaissant, merci d'avance.*

![](Cacert.png "fig:Cacert.png") Ce tutorial est uniquement pour
installer le certificat root de [CAcert.org](http://www.cacert.org) pour
Internet explorer et outlook sous Windows.

1.  Première étape, [télécharger le certificat
    root](http://www.cacert.org/certs/root.crt) de
    [CAcert.org](http://www.cacert.org).
2.  L'écran "Téléchargement" devrait apparaitre\
     ![Téléchargement](Téléchargement.png "fig:Téléchargement")
3.  En cliquant sur "Ouvrir", l'écran "Certificat" devrait apparaitre\
     ![Certificat](Certificat.png "fig:Certificat")
4.  Il faut alors cliquer sur "Installer le certificat" pour voir
    l'assitant d'importation de certificat, il suffit alors de cliquer
    sur "Suivant" 2 fois, puis sur "Terminer"\
     ![Assistant](Assistant importation 1.png "fig:Assistant")
    ![Assistant
    suite](Assistant importation 2.png "fig:Assistant suite")
    ![Assistant fin](Assistant importation fin.png "fig:Assistant fin")
5.  Windows va alors vous avertir avec l'écran "Avertissement de
    sécurité" que la vérification du certificat de CACert.org n'est pas
    automatisable, et qu'il faut vérifier à la main l'empreinte du
    certificat : 135CEC36 F49CB8E9 3B1AB270 CD808846 76CE8F33\
     ![Avertissement de
    sécurité](Avertissement sécurité.png "fig:Avertissement de sécurité")
6.  Une fois cette opération terminé, en cliquant sur "Oui", Windows
    vous informe que tout c'est bien passé\
     ![Confirmation](Confirmation.png "fig:Confirmation")

