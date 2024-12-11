class AddIdToArticles < ActiveRecord::Migration[8.0]
  def change
    add_column :articles, :id, :primary_key
  end
end
