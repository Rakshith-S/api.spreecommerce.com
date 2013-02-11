require "bundler/capistrano"
$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.

set :application, 'guides'
set :user, 'spree'
set :group, 'www-data'
set :domain, 'www.spreecommerce.com'

set :rvm_type, :system
set :rvm_ruby_string, 'ruby-1.9.2-p290'

set :scm, :git

role :web, domain
role :app, domain
role :db,  domain, :primary => true

set :repository,  "git://github.com/spree/guides.spreecommerce.com"

#if exists?(:edge)
  set :branch, "new_guides"
#else
  #set :branch, "1-2-x"
#end

set :deploy_to,   "/data/#{application}"
set :deploy_via,  :remote_cache
set :use_sudo,    false

set :default_environment, {
  'PATH' => "/usr/local/rvm/gems/ruby-1.9.2-p290/bin:/usr/local/rvm/gems/ruby-1.9.2-p290@global/bin:/usr/local/rvm/rubies/ruby-1.9.2-p290/bin:/usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH",
  'RUBY_VERSION' => 'ruby 1.9.2p290',
  'GEM_HOME'     => '/usr/local/rvm/gems/ruby-1.9.2-p290',
  'GEM_PATH'     => '/usr/local/rvm/gems/ruby-1.9.2-p290:/usr/local/rvm/gems/ruby-1.9.2-p290@global'
}

default_run_options[:pty] = true
set :ssh_options, { :forward_agent => true }

namespace :deploy do
  desc "Builds static html for api"
  task :build_api do
    cmd = "cd #{release_path} && bundle exec nanoc compile"
    #cmd << " --edge" if exists?(:edge)
    run cmd
  end

  # desc "Symlink shared configs and folders on each release."
  # task :symlink_shared do
  #   if exists?(:edge)
  #     run "ln -nfs #{shared_path}/config/robots.txt #{release_path}/output/robots.txt"
  #     run "ln -nfs #{shared_path}/config/favicon.ico #{release_path}/output/favicon.ico"
  #   else
  #     run "ln -nfs #{shared_path}/legacy #{release_path}/output/legacy"
  #   end
  # end
end

after 'deploy:update_code', 'deploy:build_api'
#after 'deploy:build_api', 'deploy:symlink_shared'
