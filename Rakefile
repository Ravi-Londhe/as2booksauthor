# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :sandbox do
  desc "Reseed the database"
  task reseed: :environment do
    Rake::Task["sandbox:reset"].invoke
    Rake::Task["db:environment:set"].invoke
    Rake::Task["db:schema:load"].invoke
    Rake::Task["db:seed"].invoke
  end

  desc "Reset the database"
  task reset: :environment do
    ActiveRecord::Base.connection.tables.each do |table|
      if table != "schema_migrations"
        query = "DROP TABLE IF EXISTS #{table} CASCADE;"
        ActiveRecord::Base.connection.execute(query)
      end
    end
  end
end
