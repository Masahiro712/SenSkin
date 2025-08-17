class ReviewRtagRelation < ApplicationRecord
  belongs_to :review
  belongs_to :rtag
end
