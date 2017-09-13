class Message < ApplicationRecord
  belongs_to :work
  belongs_to :messageable, polymorphic: true
  mount_uploader :image, ImageUploader
  validates :has_data, presence: true

  private

  def has_data
    body.present? || image.present?
  end

end
