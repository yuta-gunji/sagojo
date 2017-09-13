class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, uniqueness: true
  has_many :candidates
  has_many :works, through: :candidates
  has_many   :messages, as: :messageable
  mount_uploader :avatar, ImageUploader
  acts_as_ordered_taggable_on :categories, :skills

end
