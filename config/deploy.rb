# config valid only for Capistrano 3.1
lock '>=3.1.0'

set :application, 'web.typo3.project.mtit'
set :repo_url, 'git@bitbucket.org:digitalpatrioten/web.typo3.project.mtit.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/www/web.typo3.project.mtit'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{htdocs/.htaccess htdocs/typo3conf/AdditionalConfiguration.php config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{htdocs/uploads htdocs/fileadmin htdocs/typo3temp}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# if you haven't already specified
set :rails_env, "production"

# if you want to remove the local dump file after loading
set :db_local_clean, true

# if you want to remove the dump file from the server after downloading
set :db_remote_clean, true

# If you want to import assets, you can change default asset dir (default = system)
# This directory must be in your shared directory on the server

set :assets_dir, %w(htdocs/fileadmin htdocs/uploads)
set :local_assets_dir, "htdocs/"

# if you want to work on a specific local environment (default = ENV['RAILS_ENV'] || 'development')
set :locals_rails_env, "development"

# if you are highly paranoid and want to prevent any push operation to the server
#set :disallow_pushing, true

# Pass options to Airbrussh
set :format_options, log_file: nil

SSHKit.config.command_map[:composer] = "php #{shared_path.join("composer.phar")}"

set :composer_install_flags, '--no-dev --no-interaction --optimize-autoloader'

namespace :deploy do
  before :starting,  'composer:install_executable'
end

# --------------------------------------------
# HipChat Variables
# --------------------------------------------
# Required
set :hipchat_token, "7009e51d36940e51440fbeb97b91bb"
set :hipchat_room_name, "mtit-devchat" # If you pass an array such as ["room_a", "room_b"] you can send announcements to multiple rooms.
# Optional
set :hipchat_enabled, true # set to false to prevent any messages from being sent
set :hipchat_announce, false # notify users
set :hipchat_color, 'yellow' #normal message color
set :hipchat_success_color, 'green' #finished deployment message color
set :hipchat_failed_color, 'red' #cancelled deployment message color
set :hipchat_message_format, 'html' # Sets the deployment message format, see https://www.hipchat.com/docs/api/method/rooms/message
#set :hipchat_options, {
#  :api_version  => "v2" # Set "v2" to send messages with API v2
#}