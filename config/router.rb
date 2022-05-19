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
    elsif method == 'POST' && path == '/books/create'
      BooksController.new(env).create(params: req.params)

    # Authors
    elsif method == 'GET' && path == '/authors'
      AuthorsController.new(env).index
    elsif method == 'POST' && path == '/authors/create'
      AuthorsController.new(env).create(params: req.params)

    # Not found
    else
      [404, { 'Content-Type' => 'text/plain' }, ['404 Not Found']]
    end
  end
end
