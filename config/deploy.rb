# config valid only for current version of Capistrano
lock "~> 3.17.1"

set :application, "adwhois"
set :repo_url, "https://github.com/swobspace/adwhois.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
ask :branch, :master

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"
set :linked_files, %w{config/database.yml config/secrets.yml config/adwhois.yml}

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
set :linked_dirs, %w{log files tmp/pids tmp/cache tmp/sockets vendor/bundle}


# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :default_env, -> do
  {
    rails_relative_url_root: fetch(:relative_url_root),
    path: fetch(:ruby_path, "$PATH"),
    # just for deployment
    secret_key_base: '902b285d9d35c566a8af987d3411b80e8276746d1590db8c7d5da7eb467fecfaf9ff496a41aec0ed3dc3e466f7af71d6b083374402d0e976a737f1f0df987a0'
  }
end

set :shell, "bash -l"

namespace :deploy do
  desc "printenv"
  task :printenv do
    on roles(:all) do |host|
      execute "printenv"
    end
  end
end

namespace :precheck do
  task all: %w(check_write_permissions git:check)
  desc "Check that we can access everything"
  task :check_write_permissions do
    on roles(:all) do |host|
      if test("[ -w #{fetch(:deploy_to)} ]")
        info "#{fetch(:deploy_to)} is writable on #{host}"
      else
        error "#{fetch(:deploy_to)} is not writable on #{host}"
      end
    end
  end
end
