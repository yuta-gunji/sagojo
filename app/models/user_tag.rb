class UserTag < ApplicationRecord
  belongs_to :user
  belings_to :tag
end
