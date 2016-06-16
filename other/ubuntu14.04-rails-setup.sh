#!/bin/bash
/* 

2016-4-12
init Ubuntu server 14.04 for Rails application
author: github@1c7

software install:
  nginx
  mysql
  git
  nodejs
  ruby
  ruby on rails
*/

#
# Update
#
echo "[Setup Script]: Update Ubuntu"
sudo apt-get -y update

#
# Nginx
#
echo '[Setup Script]: install Nginx'
sudo apt-get -y install nginx

#
# MySQL
#
echo '[Setup Script]: install MySQL'
sudo apt-get -y install mysql-server

# =================================================================
#
# Ruby and Git from https://gorails.com/setup/ubuntu/14.04
#
# =================================================================
echo '[Setup Script]: Ruby and Git'
sudo apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

rbenv install 2.2.3
rbenv global 2.2.3
ruby -v

gem install bundler


# =================================================================
#
# NodeJS
#
# =================================================================
echo '[Setup Script]: Nodejs'
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

#
# Rails
#
echo '[Setup Script]: Rails'
gem install rails -v 4.2.4



ruby -v
rails -v

#
# done
#
echo '[Setup Script]: Done! :D'






