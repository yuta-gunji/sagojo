class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, uniqueness: true
  has_many :user_categories
  has_many :user_tags
  has_many :categories, through: :user_categories
  has_many :tags, through: :user_tags
  has_many :candidates
  has_many :works, through: :candidates
  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :tags
  mount_uploader :avatar, ImageUploader
end
