class Category < ApplicationRecord
  has_many :users, through: :user_categories
  has_many :works, through: :work_categories
end
