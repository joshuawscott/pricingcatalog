set :use_sudo, false
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