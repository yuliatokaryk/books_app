# frozen_string_literal: true

require_relative 'base_controller'

# Books Controller
class BooksController < BaseController
  def index
    [
      200,
      { 'Content-Type' => 'application/json' },
      [db.execute('SELECT * FROM books').to_json]
    ]
  end

  def create(params:)
    db.execute("INSERT INTO books (name, author) VALUES('#{params['name']}', '#{params['author']}')")
    [
      201,
      { 'Content-Type' => 'application/json' },
      ['successfully created']
    ]
  end
end
