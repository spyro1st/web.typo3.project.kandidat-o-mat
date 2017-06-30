server 'kom.staging.dpag.it', port: 2203, user: 'www-data', roles: %w{web app db}
set :branch, 'develop'
set :deploy_to, '/var/www/web.typo3.project.kandidat-o-mat'
# if you haven't already specified
set :rails_env, "staging"
SSHKit.config.command_map[:composer] = "php #{shared_path.join("composer.phar")}"
set :composer_working_dir, -> { File.join(fetch(:release_path), 'htdocs') }

namespace :deploy do
    desc 'Clear cache'
    task :clear_cache do
        on roles(:web), in: :sequence, wait: 5 do
            execute "cd '#{release_path}' && php ./htdocs/typo3/cli_dispatch.phpsh extbase cacheapi:clearallcaches"
        end
    end

    after :deploy, "deploy:clear_cache"
end
