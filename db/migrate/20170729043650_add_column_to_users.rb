class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :birth_year, :integer
    add_column :users, :birth_month, :integer
    add_column :users, :birth_day, :integer
    add_column :users, :sex, :integer
    add_column :users, :phone_number, :bigint
    add_column :users, :division, :string
    add_column :users, :municipality, :string
    add_column :users, :address, :string
    add_column :users, :job_experience, :text
    add_column :users, :trip_experience, :text
    add_column :users, :skills, :text
    add_column :users, :activity, :text
    add_column :users, :introduction, :text
  end
end
