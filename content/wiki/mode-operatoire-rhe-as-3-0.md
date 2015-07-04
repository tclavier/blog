+++
date = "2006-05-21"
draft = false
title = "Mode Operatoire RHE AS 3.0"
color = "pink"
icon = "laptop"
Tags = [ "mediawiki"]
description = "Mode Operatoire RHE AS 3.0"
+++

Installation d'un serveur RedHat Entreprise 3.0 à partir des CDROM
------------------------------------------------------------------

**Objectif**

Ce document a pour but de décrire l'installation d'un serveur Linux avec
la distribution RedHat Entreprise 3.0. L'installation se fera à partir
des CDROM.

**Limite**

Seule l'installation du système d'exploitation est décrite ici. Le
document décrit l'installation de l'OS sur le disque /dev/hda. Ce nom
peut différer et doit être ré-adapté au serveur cible.

**Connaissances préalable**

-   administration Linux, Unix
-   partitionnement
-   RAID (optionnel suivant la configuration disque)

**Pré-requis**

-   4 CDROM RedHat Entreprise 3.0 (RHE-3.0)
-   configuration réseau (adresse IP, DNS, passerelle, DHCP...)
-   nom de la machine

**Marche à suivre**

  ---- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  N°   Description de l'action

  1    Insérer le premier CD d'installation et démarrer le serveur. Veillez ce que la machine boot sur le CDROM

  2    Un écran de bienvenue apparaît. Une aide est disponible via les touches F1, F2... Un prompt « boot: » est affiché. Il est possible de lancer l'installation avec des options. Si vous désirez démarrer sans option, tapez <ENTER> sinon tapez « linux » suivi des options désirées puis <ENTER>. Liste des options (non-exhaustif): chargement d'un driver disque spécifique, ajoutez « dd » en cas de problèmes avec l'installer graphique, ajoutez « resolution=1024x768 » en cas de problèmes avant l'installer graphique, ajoutez « nofb » en cas de problème durant la détection du matériel, ajoutez « noprobe » en cas de problème avec la détection du moniteur, ajoutez « skipddc » Exemple: linux dd nofb Une fois validé, le démarrage de Linux commence.

  3    L'installer demande si l'on veut tester les CDROM avant de continuer. Pour ne pas tester les média, sélectionnez « skip », sinon sélectionnez « ok ». Dans le dernier cas, l'installer analysera le média encours et demandera les prochains. s'ils sont tous correct, l'installation continue.

  4    L'installateur graphique se lance et apparait une page d'accueil. Appuyez sur « next ».

  5    Sélectionnez la langue anglaise puis appuyez sur « next ».

  6    Sélectionnez le clavier français « French(pc) » puis appuyez sur « next ».

  7    Sélectionnez le type de souris qui est raccordé à la machine puis appuyez sur « next ».

  8    Sélectionner le partitionnement manuel puis appuyez sur « next ».

  9    Un écran de partitionnement apparaît. S'il existe déjà des partitions, supprimez les toutes en sélectionnant une partition puis appuyez sur le bouton « delete », et ainsi de suite pour toutes celles restante.

  10   Création de la partition /boot: cliquez sur le bouton « new », sélectionnez dans la liste déroulante « /boot » comme point de montage, "ext3" comme type de filesystème, une taille de 100Mo , de taille fixe, cochez l'option forcer en partition primaire (« force to be a primary partition ») puis « ok ».

  11   Création de la partition LVM: cliquez sur « new », sélectionnez "LVM" comme type de filesystème, sélectionnez l'option d'allocation de taille maximale (« fill to maximum allowable size »), cochez l'option forcer en partition primaire (« force to be a primary partition ») puis « ok ».

  12   Création du volume group (VG): cliquez sur le bouton « lvm », nommez le volume group « rootvg »
       
       création des filesystems dans le LVM: cliquez sur le bouton « add », une fenêtre s'ouvre. Pour chaque filesystem ci-dessous, veuillez sélectionner le point de montage, le nom du LV et la taille puis « ok ».
       
         ------------------ -------------------- ----------- ------------------------------------------------------------------------------
         Point de montage   type de filesystem   nom du LV   taille des filesystems
         /                  ext3                 rootlv      250Mo
         /usr               ext3                 usrlv       2048Mo
         /opt               ext3                 optlv       100Mo
         /tmp               ext3                 tmplv       100Mo
         /home              ext3                 homelv      100Mo
         /var               ext3                 varlv       400Mo
         N/A                swap                 swaplv      égale à la taille de la RAM avec un minimum de 512Mo et un maximum de 2048Mo
         ------------------ -------------------- ----------- ------------------------------------------------------------------------------
       
       Un fois cette fenêtre fermée, et donc revenue dans la fenêtre de partitionnement, appuyez sur « next ».

  13   Installation du bootloader : Appuyez sur « next »

  14   Installation du réseau : Par défaut la carte ethernet est en DHCP (attribution de la configuration IP dynamiquement). Pour configurer manuellement, appuyez sur le bouton « edit », décocher l'option « dhcp », mettre l'adresse IP puis le masque de sous-réseau puis <ENTER>.
       
       Si vous avez choisie le DHCP, vous pouvez renseigner le "hostname" (nom de la machine) manuellement, sinon il devra être renseigner par le serveur DHCP. Si vous avez choisie la configuration manuel, renseignez le "hostname" (obligatoire).
       
       Le renseignement de la "gateway" (passerelle) et du DNS est possible lors d'une configuration en mode manuel, si les zones ne sont pas remplie des messages d'avertissement apparaitront.

  15   Configuration du firewall (pare-feu): sélectionnez « no firewall » puis appuyez sur « next » la configuration du firewall sera faite ultérieurement.

  16   Sélection des supports de langues: Appuyez sur « next »

  17   Sélectionnez « europe/paris » puis appuyez sur « next »

  18   Saisissez deux fois le mot de passe puis appuyez sur « next »

  19   Sélectionnez « customize the set of packages to be installed » puis appuyez sur « next ».

  20   Dé-sélectionnez le package « web server », "windows file server", "printing support" et sélectionnez le package « system tools » en déselectionnant toutes les options sauf "samba-client" et "screen". Appuyez sur « next »

  21   Une écran indique que l'installation va commercer, appuyez sur next.

  22   L'installation se lance. Durant celle-ci, différents CDROM vous seront demandés.

  23   Choisissez la carte vidéo de votre machine puis appuyez sur « next ».

  24   choisissez votre écran puis appuyez sur « next ».

  25   Choix pour gdm (login graphique): vous pouvez laisser les valeurs par défaut puis appuyez sur « next ».

  26   Un écran indique la fin de l'installation, appuyez sur « exit » pour finir.

  27   La machine reboot.

  28   Une écran d'accueil apparaît, appuyez sur « next ».

  29   Lisez la licence puis Sélectionnez « yes I agree » puis appuyez sur « next ».

  30   Configurez la date puis appuyez sur « next ».

  31   Création d'un compte utilisateur: saisissez le "username" (login), son nom en entier ("full name") ainsi que son mot de passe (deux fois pour confirmation), puis appuyez sur « next ».

  32   Teste de la carte sonore: appuyez sur « next ».

  33   Enregistrement chez RedHat, sélectionnez « no » puis appuyez sur « next ».

  34   CD additionnel: appuyez sur « next ».

  35   Un écran signifiant la fin de l'installation apparaît. Appuyez sur « next ».
       
       Un écran graphique de connexion (GDM) apparaît.
  ---- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

[Category:Pole Logiciels
Libres](Category:Pole Logiciels Libres "wikilink")
