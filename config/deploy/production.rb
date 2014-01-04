set :hostname, 'remote.centricsit.com'
set :rails_env, 'production'
set :deploy_to, "/home/deploy/www/#{application}"
set :user, "deploy"
set :group, "deploy"

#chruby
default_run_options[:shell] = '/bin/bash'
set :ruby_version, 'ruby-2.0.0-p353'
set :chruby_config, '/etc/profile.d/chruby.sh'
set :set_ruby_cmd, "source #{chruby_config} && chruby #{ruby_version}"
set(:bundle_cmd) { "#{set_ruby_cmd} && exec bundle"}

role :app, hostname
role :web, hostname
role :db, hostname, primary: true

set :ssh_options, {
    keys: %w(/Users/jscott/.ssh/id_rsa),
    forward_agent: false,
    auth_methods: %w(publickey),
    port: 4022
}

