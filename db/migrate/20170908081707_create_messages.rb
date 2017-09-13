class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text        :body
      t.string      :image
      t.references  :work, null: false, foreign_key: true
      t.references  :messageable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
