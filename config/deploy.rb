require 'rubygems'
require 'capcake'

set :application, "Lol blog"
#set :repository,  "set your repository location here"

#set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

default_run_options[:pty] = true  # Must be set for the password prompt from git to work
set :repository, "git@github.com:lolmaus/test01.git"  # Your clone URL
set :scm, "git"
set :user, "deployer"  # The server's user for deploys
set :scm_passphrase, "a9w568n3cx5b"  # The deploy user's password

ssh_options[:forward_agent] = true

server "sportan.lolmaus.ru", :app, :db, :primary => true

set :cake_branch, "1.3.4"

role :web, "www.salam.lolmaus.ru"                          # Your HTTP server, Apache/etc
role :app, "your app-server here"                          # This may be the same as your `Web` server
role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
role :db,  "your slave db-server here"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

capcake