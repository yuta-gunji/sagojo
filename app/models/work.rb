class Work < ApplicationRecord
  validates :title, presence: true
  belongs_to :company
  has_many :candidates
  has_many :users, through: :candidates
  mount_uploader :image, ImageUploader
  acts_as_ordered_taggable_on :categories, :skills
end
