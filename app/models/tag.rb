class Tag < ApplicationRecord
  has_many :works, through: :work_tags
  has_many :users, through: :user_tags
  validates :name, uniqueness: true
end
