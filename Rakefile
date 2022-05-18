# frozen_string_literal: true

require 'dotenv/load'
require_relative 'db/db_creator'
require_relative 'db/db_migrator'
require_relative 'lib/database_seeds/main'

namespace :db do
  task :create do
    DBCreator.new.call
  end

  task :migrate do
    DBMigrator.new.call
  end

  task :seed do
    DatabaseSeeds::Main.execute
  end
end
