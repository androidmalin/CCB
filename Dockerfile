# 基于什么 Image(from dockerhub)
FROM rails:onbuild
# FROM rails:onbuild -- https://hub.docker.com/_/rails/


# Optionally set a maintainer name to let people know who made this image.
MAINTAINER Cheng Zheng <chengzheng.apply@gmail.com>


# Set an environment variable to store where the app is installed to inside
# of the Docker image.
# 设置一个环境变量, 代表 app 安装到 Docker image 里的哪个位置
ENV INSTALL_PATH /haha
RUN mkdir -p $INSTALL_PATH

# This sets the context of where commands will be ran in and is documented
# on Docker's website extensively.
WORKDIR $INSTALL_PATH


# Ensure gems are cached and only get updated when they change. This will
# drastically increase build times when your gems do not change.
COPY Gemfile Gemfile
RUN bundle install


# Copy in the application code from your work station at the current directory
# over to the working directory.
COPY . .

# Provide dummy data to Rails so it can pre-compile assets.
RUN bundle exec rake RAILS_ENV=production

# Expose a volume so that nginx will be able to read in assets in production.
VOLUME ["$INSTALL_PATH/public"]

# The default command that gets ran will be to start the Unicorn server.
RUN RAILS_ENV=production rake db:create db:migrate 
CMD puma





# ===============================
#
#   例子------- 网上找的不是我写的
#
#=================================
# 创建代码所运行的目录 
#RUN mkdir -p /usr/src/app  
#WORKDIR /usr/src/app

# 使 webserver 可以在容器外面访问
#EXPOSE 80

# 设置环境变量
#ENV PORT=80
# 启动 web 应用
# CMD ["foreman","start"]


# 安装所需的 gems 
#ADD Gemfile /usr/src/app/Gemfile  
#ADD Gemfile.lock /usr/src/app/Gemfile.lock  
#RUN bundle install --without development test


# 将 rails 项目（和 Dockerfile 同一个目录）添加到项目目录
#ADD ./ /usr/src/app


## 运行 rake 任务
# RUN RAILS_ENV=production rake db:create db:migrate 







