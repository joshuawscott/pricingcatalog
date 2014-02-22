
set :use_sudo, false
require 'bundler/capistrano'
require 'capistrano-unicorn'
set :stages, %w(production staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'

set :application, "pricingcatalog"
set :user, "www-data"
set :group, "www-data"

set :scm, :git
set :repository, "git@github.com:joshuawscott/#{application}.git"
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache

namespace :deploy do
  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/salesforce.yml #{release_path}/config/salesforce.yml"
  end
  after "deploy", "deploy:symlink_config"
  after "deploy", "unicorn:restart"
end

