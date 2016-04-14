## 这个项目是用 Ruby on Rails 写的
用途: Android APP 后台界面 和 API

## Ruby on Rails Backend for Android APP
Just for practice, Please don't star.  

<br/>
### Development ENV - 开发环境
Win10 x64 + (Vmware) Ubuntu 14.04 LTS <br/><br/>

Ruby 2.2.0<br/>
Rails 4.2.4<br/> <br/>

AdminLTE<br/>
MySQL <br/>
Sidekiq  这个是做后台任务的 <br/>
Redis 内存数据库 <br/>
Capistrano 3 做自动部署 <br/>


<br/>
### How to run 
```
  rake db:create  # create database
  rake db:migrate  # create table
  rails s  # for development, use WEBrick
```
 
<br/>
#### 需要手工创建的文件夹
```
mkdir -p public/uploads/serie public/uploads/episode/ 
```
two folder for upload image


<br/>
#### 这样在虚拟机里启动, 外面才访问的到
原理不明..没深究  

```
rails s -b 0.0.0.0  
```
http://stackoverflow.com/questions/27627286/cant-connect-localhost3000-ruby-on-rails-in-vagrant  


<br/>
#### 以 production(生产) 模式启动
就是如果你要上线了就要换到这个模式
````
rails s -e production
```
会提示
Missing `secret_token` and `secret_key_base` for 'production' environment, set these values in `config/secrets.yml` 
这是个和安全相关的文件, 
我从 git 里移除了, 所以你 pull 下来没有这个文件. 要跑的话要么用开发模式(development) 或者自己弄个 config/secrets.yml





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



<br/>
#### 部署
cap production deploy
意思是用 Capistrano 部署, 
production 的意思是部署的环境,  config/deploy/production.rb 就是这里指的
deploy 是部署的意思,  config/deploy.rb 里的 deploy 部分代码





