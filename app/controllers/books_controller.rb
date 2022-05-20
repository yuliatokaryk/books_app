# frozen_string_literal: true

require_relative 'base_controller'

# Books Controller
class BooksController < BaseController
  def index
    @books = db.execute("SELECT * FROM books")

    [
      200,
      { 'Content-Type' => 'text/html' },
      [ERB.new(File.read('app/views/books/index.html.erb')).result(binding)]
    ]
  end

  def new_book
    @authors = db.execute("SELECT * FROM authors")

    [
      200,
      { 'Content-Type' => 'text/html' },
      [ERB.new(File.read('app/views/books/new_book.html.erb')).result(binding)]
    ]
  end

  def show(id) # rubocop:disable Metrics/MethodLength
    books = db.execute("SELECT * FROM books WHERE id = #{id}")

    if books == []
      [
        404,
        { 'Content-Type' => 'text/plain' },
        ["book #{id} not found"]
      ]
    else
      [
        200,
        { 'Content-Type' => 'application/json' },
        [books.to_json]
      ]
    end
  end

  def create(params:)
    db.execute("INSERT INTO books (name, author_id) VALUES('#{params['name']}', '#{params['author_id']}')")

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
