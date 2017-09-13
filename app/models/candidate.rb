class Candidate < ApplicationRecord
  belongs_to :user
  belongs_to :work

  def self.applied_work?(work_id, user_id)
    where(work_id: work_id, user_id: user_id).present?
  end
end
