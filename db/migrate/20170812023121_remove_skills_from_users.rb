class RemoveSkillsFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :skills, :text
  end
end
