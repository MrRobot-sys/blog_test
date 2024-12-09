class Article < ApplicationRecord

  def get_full_name
    pp("Hello, #{name}")
  end

  def self.get_full
    self.class
  end


end
