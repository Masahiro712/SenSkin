class Likea < ApplicationRecord
  belongs_to :lifestyle
  belongs_to :user

  validates_uniqueness_of :lifestyle_id, scope: :user_id
end
