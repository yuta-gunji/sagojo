class RemoveTagsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :user_tags
    drop_table :work_tags
    drop_table :tags
  end
end
