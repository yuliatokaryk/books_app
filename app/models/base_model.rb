# frozen_string_literal: true

# Base model
class BaseModel
  private

  def db
    @db ||= Database.new.connection
  end
end
