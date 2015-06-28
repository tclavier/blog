+++
date = "2005-08-21"
draft = false
title = "Kenitec 8375X"
color = "yellow"
icon = "bell-o"
Tags = ["linux", "mediawiki"]
description = "Kenitec 8375X"
+++

Heureux possesseur d'un ordinateur portable Kenitec 8375X, je vous livre
ici mes astuces de configuration pour Debian GNU/Linux. Le Medion
MD41116 semble identique.

### Introduction

-   Le gros avantage, pas d'OS.
-   Debian GNU/Linux sid
-   999 Euro chez Youg's

### Présentation générale

Le document de référence : <http://www.kenitec.net/pdf/8375.pdf>

-   CPU : AMD Athlon 2600+ Mobility
-   FSB : 266 Mhz
-   DD : 40 Go
-   Vidéo : Savage 32 Mo partagé et écran 15 pouces 1024x768
-   Ram : 512 Mo de DDRam
-   Combo, lecteur DVD, graveur de CD.

### Linux

#### analyse technique

##### lspci

    0000:00:00.0 Host bridge: VIA Technologies, Inc. P/KN266 Host Bridge
    0000:00:01.0 PCI bridge: VIA Technologies, Inc. VT8633 [Apollo Pro266 AGP]
    0000:00:09.0 CardBus bridge: ENE Technology Inc CB1410 Cardbus Controller (rev 01)
    0000:00:0b.0 FireWire (IEEE 1394): VIA Technologies, Inc. IEEE 1394 Host Controller (rev 80)
    0000:00:10.0 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller (rev 80)
    0000:00:10.1 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller (rev 80)
    0000:00:10.3 USB Controller: VIA Technologies, Inc. USB 2.0 (rev 82)
    0000:00:11.0 ISA bridge: VIA Technologies, Inc. VT8235 ISA Bridge
    0000:00:11.1 IDE interface: VIA Technologies, Inc. VT82C586A/B/VT82C686/A/B/VT823x/A/C PIPC Bus Master IDE (rev 06)
    0000:00:11.5 Multimedia audio controller: VIA Technologies, Inc. VT8233/A/8235/8237 AC97 Audio Controller (rev 50)
    0000:00:11.6 Communication controller: VIA Technologies, Inc. Intel 537 [AC97 Modem] (rev 80)
    0000:00:12.0 Ethernet controller: VIA Technologies, Inc. VT6102 [Rhine-II] (rev 74)
    0000:01:00.0 VGA compatible controller: S3 Inc. VT8375 [ProSavage8 KM266/KL266]

#### Réseau

La carte réseau est une VIA VT6102 Rhine II.

    # dmesg |grep eth0
    eth0: VIA VT6102 Rhine-II at 0xe300, 00:40:d0:54:28:86, IRQ 10.
    eth0: MII PHY found at address 1, status 0x7849 advertising 05e1 Link 0000.
    eth0: no IPv6 routers present

Pour l'utiliser, il faut charger le module via\_rhine

#### CPU

Pour controler automatiquement la fréquence du CPU, apt-get install
cpufreqd

#### ACPI

Commençons par installer acpid

     apt-get install acpi acpid

Reste à configurer les actions sur le bouton power, la fermeture de
l'écran ...

#### Touchpad

C'est un Synaptics, il faut donc utiliser le module correspondant dans
XFree. Sous debian, pour installer le paquet, il suffit de faire
"apt-get install xfree86-driver-synaptics" et de modifier le fichier
XF86Config-4. Voici les extraits utile de mon fichier
/etc/X11/XF86Config-4

    Section "Module"
            [...]
            Load    "synaptics"
    EndSection
    [...]
    Section "InputDevice"
            Identifier      "Touchpad"
            Driver          "synaptics"
            Option          "CorePointer"
            Option          "Device"        "/dev/psaux"
            Option          "Protocol"      "auto-dev"
            Option          "LeftEdge"      "1700"
            Option          "RightEdge"     "5300"
            Option          "TopEdge"       "1700"
            Option          "BottomEdge"    "4200"
            Option          "FingerLow"     "25"
            Option          "FingerHigh"    "30"
            Option          "MaxTapTime"    "180"
            Option          "MaxTapMove"    "220"
            Option          "VertScrollDelta" "100"
            Option          "MinSpeed"      "0.06"
            Option          "MaxSpeed"      "0.12"
            Option          "AccelFactor"   "0.0010"
    EndSection
    [...]
    Section "ServerLayout"
            [...]
            InputDevice     "Touchpad"
    EndSection

#### Son

Comme indiqué par lspci c'est une "VT8233/A/8235/8237 AC97 Audio
Controller (rev 50)" c'est donc logiquement qu'il faut charger le module
snd\_via82xx, pour éviter tout grésillement j'ai dut forcé les
paramètres suivant : index=0 dxs\_support=3

#### Vidéo

La carte vidéo est une ProSavageDDR, On trouve ces indications dans le
fichier de log d'XFree86 ou dans le lspci : S3 Inc. [ProSavageDDR
K4M266]

Avec les paramètres par défaut on réussit l'exploit de faire scintillé
très désagréablement l'écran LCD. En forçant 2 options, on corrige le
problème. Voici l'extrait de mon fichier de configuration
(/etc/X11/XF86Config-4) :

    Section "Device"
            Identifier      "Carte vidéo"
            Option          "UseBIOS" "off"
            Option          "LCDClock" "220MHz"
            Driver          "savage"
    EndSection

Pour la 3D, il faut :

-   ajouter les 2 lignes suivantes dans le fichier /etc/apt/source.list
    :

<!-- -->

    deb http://www.nixnuts.net/files/ ./
    deb-src http://www.nixnuts.net/files/ ./

-   puis, "apt-get install xlibmesa-gl1-dri-trunk
    xserver-xfree86-dri-trunk"
-   il faut aussi installer les entêtes du kernel que vous utilisez.
    Chez moi : "apt-get install kernel-headers-2.6-k7"
-   et enfin "apt-get install drm-trunk-module-src" ce dernier paquet
    automatise la compilation des modules drm.
-   après une mise à jour du noayu, il faut lancer la commande
    "dpkg-reconfigure drm-trunk-module-src" pour recompiler les modules
    drm

#### Modem

C'est un SmartLink Modem, il faut donc installer le pilote correspondant
:

     apt-get install sl-modem-daemon

Pour le configurer, je vous conseil vivement le paquet pppconfig

#### Firewire

#### Irda (port infrarouge)

Avec un noyau 2.6.12, il suffit d'installer irda-utils

     apt-get install irda-utils

répondre dans l'ordre :

    oui
    oui
    natif
    via-ircc
    laisser vide et ok
    laisser vide et ok

l'interface infrarouge alors disponible est irda0 (ifconfig irda0 up par
exemple)
