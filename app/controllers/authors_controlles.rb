# frozen_string_literal: true

require "#{ENV['APP_FULL_PATH']}/config/database"
require_relative 'base_controller'

# Books Controller
class AuthorsController < BaseController
  def index
    [
      200,
      { 'Content-Type' => 'text/plain' },
      [
        Database.new.connection.execute('SELECT * FROM authors').to_json
      ]
    ]
  end
end
