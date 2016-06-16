workers Integer(ENV['WEB_CONCURRENCY'] || 1)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!
activate_control_app

app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"

rackup      DefaultRackup
environment ENV['RACK_ENV'] || 'production'

#bind "unix://#{shared_dir}/tmp/sockets/puma.socket"
#bind 'unix:///var/run/puma.sock'
#bind "unix:///tmp/reco.sock"
bind "unix:///var/www/CCB/tmp/sockets/puma.sock"
pidfile "/var/www/reco/tmp/pids/puma.pid"
state_path "/var/www/reco/tmp/pids/puma.state"


# Logging
#stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# Set master PID and state locations
#pidfile "#{shared_dir}/pids/puma.pid"
#state_path "#{shared_dir}/pids/puma.state"
#activate_control_app

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end
