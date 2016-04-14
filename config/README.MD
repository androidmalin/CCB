

### nginx.conf 是远程服务器的 /etc/nginx/sites-enabled/default
因为之前跑过了

sudo rm /etc/nginx/sites-enabled/default
sudo ln -nfs /var/www/CCB/current/config/nginx.conf /etc/nginx/sites-enabled/default
sudo service nginx start


### local-nginx.conf 是我开发机上的 /etc/nginx/sites-enabled/default
因为之前跑过了

sudo rm /etc/nginx/sites-enabled/default
sudo ln -nfs ~/Desktop/CCB/config/local-nginx.conf /etc/nginx/sites-enabled/default
sudo service nginx start

这俩内容不一样的


