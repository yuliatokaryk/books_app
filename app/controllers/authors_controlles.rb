# frozen_string_literal: true

require_relative 'base_controller'

# Books Controller
class AuthorsController < BaseController
  def index
    @authors = db.execute("SELECT * FROM authors")

    [
      200,
      { 'Content-Type' => 'text/html' },
      [ERB.new(File.read('app/views/authors/authors.html.erb')).result(binding)]
    ]
  end

  def new_author
    @countries = db.execute("SELECT * FROM countries")

    [
      200,
      { 'Content-Type' => 'text/html' },
      [ERB.new(File.read('app/views/authors/new_author.html.erb')).result(binding)]
    ]
  end

  def show(id) # rubocop:disable Metrics/MethodLength
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
    db.execute("INSERT INTO authors (name, country_id) VALUES('#{params['name']}', '#{params['country_id']}')")

    [
      301,
      {
        'http-equiv' => 'refresh',
        'location' => '/books'
      },
      []
    ]
  end
end
