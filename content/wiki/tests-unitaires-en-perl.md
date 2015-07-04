+++
date = "2012-07-31"
draft = false
title = "Tests unitaires en perl"
color = "pink"
icon = "bell-slash-o"
Tags = [ "mediawiki"]
description = "Tests unitaires en perl"
+++

Je ne parlerais pas du modèle classique d'organisation du code en Perl :

-   toute la logique dans un module
-   un ou des scripts qui ne font qu'utiliser le module
-   les tests qui font eux aussi appel au module

Ce qui implique d'avoir au moins 3 fichiers différents ...

Dans mon cas, j'ai un simple script perl que je souhaite écrire en TDD
... impossible d'écrire des .pm

mon\_script.pl

    #!/usr/bin/perl -w
    use strict;
    use warning;

    sub run {
      print "Hello world!";
      return "OK";
    }

    run() unless caller();
    1;

mon\_script.t

    #!/usr/bin/perl -w
    use strict;
    use warnings;
    use Test::More;
    require "mon_script.pl";

    my $ret = run()
    is($ret, "OK");

    done_testing()

Liens
-----

<http://lampzone.wordpress.com/2012/04/03/pbp-part2-unit-test-your-perl-script/>
