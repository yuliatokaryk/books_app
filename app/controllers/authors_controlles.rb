# frozen_string_literal: true

require "#{ENV['APP_FULL_PATH']}/config/database"
require_relative 'base_controller'

# Books Controller
class AuthorsController < BaseController
  def index
    [
      200,
      { 'Content-Type' => 'application/json' },
      [
        Database.new.connection.execute('SELECT * FROM authors').to_json
      ]
    ]
  end

  def create(params:)
    Database.new.connection.execute("INSERT INTO authors (name, country) VALUES('#{params['name']}', '#{params['country']}')")
    [
      201,
      { 'Content-Type' => 'application/json' },
      [
        'successfully created'
      ]
    ]
  end


end
