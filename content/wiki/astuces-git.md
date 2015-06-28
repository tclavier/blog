+++
date = "2013-08-23"
draft = false
title = "Astuces git"
color = "orange "
icon = "plus"
Tags = [ "mediawiki"]
description = "Astuces git"
+++

Proxy
-----

### <http://>

git utilise libcurl pour les accès http/https donc les exports de
variables fonctionnent

`export http_proxy=`[`http://proxy:3128`](http://proxy:3128)\
`git ls-remote `[`http://`](http://)`....`

### <git://>

debug
-----

    export GIT_TRACE=1 
    export GIT_CURL_VERBOSE=1
