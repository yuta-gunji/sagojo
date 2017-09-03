class Candidate < ApplicationRecord
  belongs_to :user
  belongs_to :work
  scope :applied_work?, ->(work_id) { where(work_id: work_id).present? }
end
