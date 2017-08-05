class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.text        :image
      t.text        :outline
      t.string      :fee
      t.text        :qualification_requirements
      t.string      :headcount
      t.text        :span
      t.string      :area
      t.date        :recruitment_end_date
      t.references  :company, null: false, foreign_key: true
      t.timestamps
    end
  end
end
