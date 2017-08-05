class CreateWorkTags < ActiveRecord::Migration[5.0]
  def change
    create_table :work_tags do |t|
      t.references  :work, null: false, foreign_key: true
      t.references  :tag, null: false, foreign_key: true
      t.timestamps
    end
  end
end
