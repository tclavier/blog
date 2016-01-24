from tclavier/nginx
add https://github.com/spf13/hugo/releases/download/v0.15/hugo_0.15_amd64.deb /tmp/
run dpkg -i /tmp/hugo_0.15_amd64.deb
add . /site
run cd /site && /usr/bin/hugo --destination=/var/www
add src/nginx_vhost.conf /etc/nginx/conf.d/blog.conf
