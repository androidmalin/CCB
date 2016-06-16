## Ruby on Rails project for Android APP back end

```
sudo puma -e development -C config/local-puma.rb 
```

ssh ubuntu@GZ <br/>

<br/>
### ENV
Mina ( deploy )<br/>
Puma ( server ) <br/>

Ruby 2.2.0<br/>
Rails 4.2.4<br/> <br/>

AdminLTE<br/>
MySQL <br/>
Sidekiq  这个是做后台任务的 <br/>
Redis 内存数据库 <br/>
Win10 x64 + (Vmware) Ubuntu 16.04 LTS <br/><br/>


<br/>
### How to run 
```
  rake db:create  # create database
  rake db:migrate  # create table
```
 
<br/>
#### 需要手工创建的文件夹
```
mkdir -p public/uploads/serie public/uploads/episode/ 
```
two folder for upload image


<br/>
### 如果 Rake 碰到错误
比如:
```
rake aborted!
Gem::LoadError: You have already activated rake 11.1.2, but your Gemfile requires rake 11.1.1. Prepending `bundle exec` to your command may solve this.
```
运行这个即可
```
bundle update rake
```
http://stackoverflow.com/questions/6080040/you-have-already-activated-rake-0-9-0-but-your-gemfile-requires-rake-0-8-7


<!--
<br/>
#### 部署
cap production deploy
意思是用 Capistrano 部署, 
production 的意思是部署的环境,  config/deploy/production.rb 就是这里指的
deploy 是部署的意思,  config/deploy.rb 里的 deploy 部分代码
-->




