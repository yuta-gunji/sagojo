class Work < ApplicationRecord
  belongs_to :company
  has_many :categories, through: :work_categories
  has_many :tags, through: :work_tags
end
