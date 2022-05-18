# frozen_string_literal: true

require_relative 'base_controller'

# Home Controller
class HomeController < BaseController
  def index
    [
      200,
      { 'Content-Type' => 'text/html' },
      [
        '<p style="color: red">Hello, you\'re at the Home page. HeLLLLLOOOOOOO<p>',
        '<p style="color: green">Hello, you\'re at the Home page. HeLLLLLOOOOOOO<p>',
        '<p style="color: blue">Hello, you\'re at the Home page. HeLLLLLOOOOOOO<p>'
      ]
    ]
  end
end
