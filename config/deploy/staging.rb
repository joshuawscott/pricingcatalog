set :hostname, 'ec2-54-200-171-179.us-west-2.compute.amazonaws.com'
set :rails_env, 'staging'
set :deploy_to, "/home/ubuntu/www/#{application}"
set :user, "ubuntu"
set :group, "ubuntu"

role :app, hostname
role :web, hostname
role :db, hostname

require "rvm/capistrano"

set :rvm_ruby_string, 'ruby-2.0.0-p247'

set :rvm_autolibs_flag, "read-only"       # more info: rvm help autolibs

before 'deploy:setup', 'rvm:install_rvm'  # install/update RVM
before 'deploy:setup', 'rvm:install_ruby' # install Ruby and create gemset, OR:


set :ssh_options, {
  keys: %w(/Users/jscott/.ssh/mykey.pem),
  forward_agent: false,
  auth_methods: %w(publickey)
}
