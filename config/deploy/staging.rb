set :domain, "root@93.188.163.113"
role :web, domain                     # Your HTTP server, Apache/etc
role :app, domain                     # This may be the same as your `Web` server
role :db,  domain, :primary => true  # This is where Rails migrations will run

set :deploy_to, "/home/fake-rails2/"
set :branch, 'master'
set :rails_env, 'production'

set :database, {:name => 'fake-rails2_production', :user => 'root', :password => 'quertyui47'}

namespace :deploy do
  task :create_db do
    run "cd #{current_release} && bundle exec rake RAILS_ENV=production  db:create"
  end

  task :seed do
    run "cd #{current_release} && bundle exec rake RAILS_ENV=production  db:seed"
  end
end