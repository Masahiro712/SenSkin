class Rtag < ApplicationRecord
    validates :name, presence: true
    
    has_many :review_rtag_relations, dependent: :destroy
    
    has_many :reviews, through: :review_rtag_relations, dependent: :destroy
end
