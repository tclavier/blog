+++
date = "2005-07-09"
draft = false
title = "Des photos en vidéo"
color = "cyan"
icon = "underline"
Tags = ["trucs et astuces", "mediawiki"]
description = "Des photos en vidéo"
+++

pour stocker des photos digitales sur un CD au format VCD ou SVCD.

Il y a GNU VCDImager, paquet woody vcdimager disponible en mettant

` deb `[`http://dpt.tuxfamily.org/pub`](http://dpt.tuxfamily.org/pub)` woody main`

dans le sources.list

voir sur <http://www.vcdimager.org>, et en particulier
<http://www.vcdimager.org/guides/mpeg_still_images.html>

Il faut utiliser la commande vcdxbuild, mais pour cela il faut fabriquer
un fichier xml qui décrit le contenu du VCD. Peut-être il y a un
«front-end» plus simple ...

------------------------------------------------------------------------

Il y a aussi les [kvcdtools](http://kvcdtools.free.fr/)

En 2003 l'auteur résumai ainsi: "Il y a deja kimg2mpg qui est
completement termine pour la conversion d'une suite de fichiers JPG en
un flux MPEG. Ensuite tu utilises K3b pour creer un VCD ou un SVCD."

En fait, kimg2mpg est un front-end pour img2mpg un script qui transforme
avec les mjpegTools une suite d'images en vidéo. J'ai utiliser cette
ligne de commande pour avoir un XSVCD :

     img2mpg -T /tmp -t 20 -o /home/tom/video_xsvcd.avi -i *.sized.jpg

------------------------------------------------------------------------

avec transcode :

     transcode -i list -x imlist,null -g 352x288 -y xvid,null -f 1 -o movie.avi -H 0
