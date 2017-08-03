class AddNameToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :name, :string, null: false
    add_index  :companies, :name, unique: true
  end
end
