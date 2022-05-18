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
    if method == 'GET' && path == '/'
      HomeController.new(env).index
    elsif method == 'GET' && path == '/books'
      BooksController.new(env).index
    elsif method == 'POST' && path == '/books/create'
      BooksController.new(env).create(params: request_params)
    else
      [404, { 'Content-Type' => 'text/plain' }, ['404 Not Found']]
    end
  end

  private

  def request_params
    JSON.parse(req.body.read)
  end
end
