# frozen_string_literal: true

require_relative 'base_model'

# Country model
class Country < BaseModel
  def all
    db.execute("SELECT * FROM countries")
  end

  def find_by_id(id)
    db.execute("SELECT * FROM countries WHERE id = #{id}")
  end
end
