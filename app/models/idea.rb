class Idea < ApplicationRecord
  belongs_to :user

  has_many :reviews, lambda { order(created_at: :DESC) }, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  before_save :titleize_title

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  def liked_by?(user)
    likes.exists?(user: user)
  end

  def like_for(user)
    likes.find_by(user: user)
  end

  private

  def titleize_title
    self.title = title.titleize
  end

end
