class RemoveSomeTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :user_categories
    drop_table :work_categories
    drop_table :categories
  end
end
