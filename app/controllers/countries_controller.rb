# frozen_string_literal: true

require_relative 'base_controller'

# Books Controller
class CountriesController < BaseController
  def index
    @countries = db.execute("SELECT * FROM countries")

    [
      200,
      { 'Content-Type' => 'text/html' },
      [ERB.new(File.read('app/views/countries/countries.html.erb')).result(binding)]
    ]
  end

  def new_country
    [
      200,
      { 'Content-Type' => 'text/html' },
      [ERB.new(File.read('app/views/countries/new_country.html.erb')).result(binding)]
    ]
  end

  def show(id) # rubocop:disable Metrics/MethodLength
    countries = db.execute("SELECT * FROM countries WHERE id = #{id}")

    if countries == []
      [
        404,
        { 'Content-Type' => 'text/plain' },
        ["countries #{id} not found"]
      ]
    else
      [
        200,
        { 'Content-Type' => 'application/json' },
        [countries.to_json]
      ]
    end
  end

  def create(params:)
    db.execute("INSERT INTO countries (name) VALUES('#{params['name']}')")
    [
      301,
      {
        'http-equiv' => 'refresh',
        'location' => '/countries'
      },
      []
    ]
  end
end
