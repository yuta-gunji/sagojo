class AddIndexToCategories < ActiveRecord::Migration[5.0]
  def change
    remove_index :categories, :name
    remove_index :tags, :name
    add_index :categories, :name, unique: true
    add_index :tags, :name, unique: true
  end
end
