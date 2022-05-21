# frozen_string_literal: true

require_relative 'base_controller'
require_relative '../models/authors.rb'

# Books Controller
class AuthorsController < BaseController
  def index
    @authors = Author.new.all

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
    author = Author.new.find_by_id(id)

    if author == []
      [
        404,
        { 'Content-Type' => 'text/plain' },
        ["author #{id} not found"]
      ]
    else
      [
        200,
        { 'Content-Type' => 'application/json' },
        [author.to_json]
      ]
    end
  end

  def create(params:)
    db.execute("INSERT INTO authors (name, country_id) VALUES('#{params['name']}', '#{params['country_id']}')")

    [
      301,
      {
        'http-equiv' => 'refresh',
        'location' => '/authors'
      },
      []
    ]
  end
end
