class Work < ApplicationRecord
  validates :outline, presence: true
  belongs_to :company
  has_many :work_categories
  has_many :work_tags
  has_many :categories, through: :work_categories
  has_many :tags, through: :work_tags
  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :tags
  mount_uploader :image, ImageUploader

end
