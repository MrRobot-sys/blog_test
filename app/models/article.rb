class Article < ApplicationRecord

  validates :name, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def get_full_name
    pp("Hello, #{name}")
  end

  def self.get_full
    self.class
  end

# PostgreSQL. Versions 9.3 and up are supported.

end
