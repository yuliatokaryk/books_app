# frozen_string_literal: true

require_relative 'base_controller'

# Books Controller
class AuthorsController < BaseController
  def index
    [
      200,
      { 'Content-Type' => 'application/json' },
      [db.execute('SELECT * FROM authors').to_json]
    ]
  end

  def show(id)
    authors = db.execute("SELECT * FROM authors WHERE id = #{id}")

    if authors == []
      [
        404,
        { 'Content-Type' => 'text/plain' },
        ["authors #{id} not found"]
      ]
    else
      [
        200,
        { 'Content-Type' => 'application/json' },
        [authors.to_json]
      ]
    end
  end

  def create(params:)
    db.execute("INSERT INTO authors (name, country) VALUES('#{params['name']}', '#{params['country']}')")
    [
      201,
      { 'Content-Type' => 'text/plain' },
      ['successfully created']
    ]
  end
end
