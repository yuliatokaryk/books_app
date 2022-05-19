# frozen_string_literal: true

module DatabaseSeeds
  # Database Seeds Dummy
  class Dummy
    class << self
      def execute
        db = Database.new.connection

        books.each do |book|
          db.execute(
            "INSERT INTO books (name, author) VALUES('#{book[:name]}', '#{book[:author]}')"
          )
        end

        authors.each do |author|
          db.execute(
            "INSERT INTO authors (name, country) VALUES('#{author[:name]}', '#{author[:country]}')"
          )
        end

        countries.each do |country|
          db.execute(
            "INSERT INTO countries (name) VALUES('#{country[:name]}')"
          )
        end
      end

      def books
        [
          { name: '1984', author: 'George Orwell' },
          { name: 'Pride and Prejudice', author: 'Jane Austin' },
          { name: 'Dracula', author: 'Bram Stoker' },
          { name: 'Tom Sawyer', author: 'Mark Twain' }
        ]
      end

      def authors
        [
          { name: 'George Orwell', country: 'British India' },
          { name: 'Jane Austin', country: 'England' },
          { name: 'Bram Stoker', country: 'Ireland' },
          { name: 'Mark Twain', country: 'U.S.A' }
        ]
      end

      def countries
        [
          { name: 'British India' },
          { name: 'England' },
          { name: 'Ireland' },
          { name: 'U.S.A' }
        ]
      end
    end
  end
end
