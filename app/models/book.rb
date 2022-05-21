# frozen_string_literal: true

require_relative 'base_model'

# Book model
class Book < BaseModel
  def all
    db.execute("SELECT * FROM books")
  end

  def find_by_id(id)
    db.execute("SELECT * FROM books WHERE id = #{id}")
  end
end
