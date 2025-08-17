class Ltag < ApplicationRecord
    validates :name, presence: true
    
    has_many :lifestyle_ltag_relations, dependent: :destroy
    
    has_many :lifestyles, through: :lifestyle_ltag_relations, dependent: :destroy
end
