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
#after "deploy:setup", "deploy:set_rvm_version"

#set :rvm_ruby_string, :local              # use the same ruby as used locally for deployment
set :rvm_autolibs_flag, "read-only"       # more info: rvm help autolibs
#namespace :deploy do
  #task :set_rvm_version, :roles => :app, :except => { :no_release => true } do
    #run "source /etc/profile.d/rvm.sh && rvm use #{rvm_ruby_string} --default"
  #end
#end

before 'deploy:setup', 'rvm:install_rvm'  # install/update RVM
before 'deploy:setup', 'rvm:install_ruby' # install Ruby and create gemset, OR:
# before 'deploy:setup', 'rvm:create_gemset' # only create gemset


# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
#role :app, %W{ubuntu@#{CONFIG[:name]}}
#role :web, %W{ubuntu@#{CONFIG[:name]}}
#role :db, %W{ubuntu@#{CONFIG[:name]}}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
#server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
  set :ssh_options, {
    keys: %w(/Users/jscott/.ssh/mykey.pem),
    forward_agent: false,
    auth_methods: %w(publickey)
  }
# and/or per server
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
# setting per server overrides global ssh_options

# fetch(:default_env).merge!(rails_env: :staging)
