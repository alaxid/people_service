#################
## Application ##
#################

set :application, "people"
set :repository,  "git://github.com/alaxid/people_service.git"
set :deploy_to, "/var/www/concierge/people"
#set :deploy_via, :remote_cache

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :branch, "master"


###############
#   Server Configs
################

server "193.136.122.76", :app, :web, :db, :primary => true

set :user, "pi2011"
#set :use_sudo, true
set :use_sudo, false

##################
# Passenger crlh
##################


namespace :deploy do
  desc "Restarting passenger"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end


