class RemoveIdFromArticles < ActiveRecord::Migration[8.0]
  def change
    remove_column :articles, :id, :string
  end
end