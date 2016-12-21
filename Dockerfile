from tclavier/nginx
add https://github.com/spf13/hugo/releases/download/v0.17/hugo_0.17-64bit.deb /tmp/
run dpkg -i /tmp/hugo_0.17-64bit.deb
add . /site
run cd /site && /usr/bin/hugo --destination=/var/www
add src/nginx_vhost.conf /etc/nginx/conf.d/blog.conf
