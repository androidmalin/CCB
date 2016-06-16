workers Integer(ENV['WEB_CONCURRENCY'] || 1)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!
activate_control_app

#项目名
app_name = "CCB"
#项目路径
application_path = "/var/www/#{app_name}"
#这里一定要配置为项目路径下地current
directory "#{application_path}/current"

#下面都是 puma的配置项
pidfile "#{application_path}/shared/tmp/pids/puma.pid"
state_path "#{application_path}/shared/tmp/sockets/puma.state"
stdout_redirect "#{application_path}/shared/log/puma.stdout.log", "#{application_path}/shared/log/puma.stderr.log"
bind "unix://#{application_path}/shared/tmp/sockets/#{app_name}.sock"
activate_control_app "unix://#{application_path}/shared/tmp/sockets/pumactl.sock"

on_restart do
  puts 'On restart...'
end
preload_app!


=begin
app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"

rackup      DefaultRackup
#port        ENV['PORT']     || 5000
environment ENV['RACK_ENV'] || 'production'

#bind "unix://#{shared_dir}/tmp/sockets/puma.socket"
#bind 'unix:///var/run/puma.sock'
#bind "unix:///tmp/reco.sock"
bind "unix:///var/www/reco/tmp/sockets/reco.sock"
pidfile "/var/www/reco/tmp/pids/puma.pid"
state_path "/var/www/reco/tmp/pids/puma.state"


# Logging
#stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# Set master PID and state locations
#pidfile "#{shared_dir}/pids/puma.pid"
#state_path "#{shared_dir}/pids/puma.state"
#activate_control_app
=end

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end


