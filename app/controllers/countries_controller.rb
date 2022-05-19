# frozen_string_literal: true

require_relative 'base_controller'

# Books Controller
class CountriesController < BaseController
  def index
    [
      200,
      { 'Content-Type' => 'application/json' },
      [db.execute('SELECT * FROM countries').to_json]
    ]
  end

  def show(id)
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
      201,
      { 'Content-Type' => 'text/plain' },
      ['successfully created']
    ]
  end
end
