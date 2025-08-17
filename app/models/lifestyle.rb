class Lifestyle < ApplicationRecord

    mount_uploader :image, ImageUploader

    belongs_to :user

    has_many :likeas, dependent: :destroy
    has_many :liked_users, through: :likeas, source: :user
    
    has_many :lifestyle_ltag_relations, dependent: :destroy
    has_many :ltags, through: :lifestyle_ltag_relations, dependent: :destroy

    #コメント
    has_many :lcomments, dependent: :destroy
end
