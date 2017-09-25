server 'mt-industrietechnik.de', user: 'dcp134400005', roles: %w{web app db}
set :branch, 'master'
set :deploy_to, '/home/www/doc/13440/dcp134400005/mt-industrietechnik.de/deployment'
# if you haven't already specified
set :rails_env, "production"
set :tmp_dir, "/home/www/doc/13440/dcp134400005/tmp"
SSHKit.config.command_map[:composer] = "/usr/local/php-5.6/bin/php #{shared_path.join("composer.phar")}"