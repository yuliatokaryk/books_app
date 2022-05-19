# frozen_string_literal: true

require "#{ENV['APP_FULL_PATH']}/config/database"

# BaseController
class BaseController
  attr_reader :env

  def initialize(env)
    @env = env
  end

  private

  def db
    @db ||= Database.new.connection
  end
end
