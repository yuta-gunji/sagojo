class Tag < ApplicationRecord
  has_many :work_tags
  has_many :user_tags
  has_many :works, through: :work_tags
  has_many :users, through: :user_tags
  validates :name, null:false
end
