class Category < ApplicationRecord
  has_many :user_categories
  has_many :work_categories
  has_many :users, through: :user_categories
  has_many :works, through: :work_categories
  validates :name, null: false
end
