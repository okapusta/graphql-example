require 'sequel'
require './lib/database'

DB = Database.establish_connection

Sequel.extension :migration, :core_extensions

namespace :db do
  desc "Migrate database"
  task :migrate do
    Sequel::Migrator.run(DB, './db/migrate')
  end

  desc "Seed database"
  task :seed do
    %x(ruby db/seed.rb)
  end
end
