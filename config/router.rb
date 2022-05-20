# frozen_string_literal: true

require 'json'

Dir[File.join(ENV['APP_FULL_PATH'], 'app/controllers/', '*.rb')].each { |file| require_relative file }

# Router
class Router
  attr_reader :env, :req, :path, :method

  def initialize(env)
    @env = env
    @req = Rack::Request.new(env)
    @path = env['PATH_INFO']
    @method = env['REQUEST_METHOD']
  end

  def call
    # Home
    if method == 'GET' && path == '/'
      HomeController.new(env).index

    # Books
    elsif method == 'GET' && path == '/books'
      BooksController.new(env).index
    elsif method == 'GET' && /^(\/books\/)\d+$/.match?(path)
      BooksController.new(env).show(path.delete('/books/'))
    elsif method == 'GET' && path == '/books/new'
      BooksController.new(env).new_book
    elsif method == 'POST' && path == '/books/create'
      BooksController.new(env).create(params: req.params)

    # Authors
    elsif method == 'GET' && path == '/authors'
      AuthorsController.new(env).index
    elsif method == 'GET' && /^(\/authors\/)\d+$/.match?(path)
      AuthorsController.new(env).show(path.delete('/authors/'))
    elsif method == 'GET' && path == '/authors/new'
      AuthorsController.new(env).new_author
    elsif method == 'POST' && path == '/authors/create'
      AuthorsController.new(env).create(params: req.params)

    # Countries
    elsif method == 'GET' && path == '/countries'
      CountriesController.new(env).index
    elsif method == 'GET' && /^(\/countries\/)\d+$/.match?(path)
      CountriesController.new(env).show(path.delete('/countries/'))
    elsif method == 'GET' && path == '/countries/new'
      CountriesController.new(env).new_country
    elsif method == 'POST' && path == '/countries/create'
      CountriesController.new(env).create(params: req.params)

    # Not found
    else
      [404, { 'Content-Type' => 'text/plain' }, ['404 Not Found']]
    end
  end
end
