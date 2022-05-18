# frozen_string_literal: true

require "#{ENV['APP_FULL_PATH']}/config/database"
require_relative 'base_controller'

# Books Controller
class BooksController < BaseController
  def index
    [
      200,
      { 'Content-Type' => 'application/json' },
      [
        Database.new.connection.execute('SELECT * FROM books').to_json
      ]
    ]
  end

  def create(params:)
    [
      201,
      { 'Content-Type' => 'application/json' },
      [
        Database.new.connection.execute("INSERT INTO books (name, author) VALUES('#{params['name']}', '#{params['author']}')")
      ]
    ]
  end
end
