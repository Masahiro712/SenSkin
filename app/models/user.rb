class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews, dependent: :destroy
  has_many :lifestyles, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_reviews, through: :likes, source: :review

  has_many :likeas, dependent: :destroy
  has_many :likead_lifesyles, through: :likeas, source: :lifestyle
  #コメント
  has_many :rcomments, dependent: :destroy
  has_many :lcomments, dependent: :destroy

  def already_liked?(review)
    self.likes.exists?(review_id: review.id)
  end

  def already_likead?(lifestyle)
    self.likeas.exists?(lifestyle_id: lifestyle.id)
  end

end
