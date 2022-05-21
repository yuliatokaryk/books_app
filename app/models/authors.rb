# frozen_string_literal: true

require_relative 'base_model'

# Author model
class Author < BaseModel
  def all
    db.execute("SELECT * FROM authors")
  end

  def find_by_id(id)
    db.execute("SELECT * FROM authors WHERE id = #{id}")
  end
end
