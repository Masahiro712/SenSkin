class Review < ApplicationRecord

    mount_uploader :image, ImageUploader

    belongs_to :user

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

    #reviewsテーブルから中間テーブルに対する関連付け
    has_many :review_rtag_relations, dependent: :destroy
    #reviewsテーブルから中間テーブルを介してTagsテーブルへの関連付け
    has_many :rtags, through: :review_rtag_relations, dependent: :destroy

    #コメント
    has_many :rcomments, dependent: :destroy

    scope :sort_good, ->{order(like: :desc)}
    scope :sort_new, ->{order(created_at: :desc)}
    scope :sort_old, ->{order(created_at: :asc)}

end
