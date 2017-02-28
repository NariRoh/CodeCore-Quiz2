class Idea < ApplicationRecord
  belongs_to :user
  has_many :reviews, lambda { order(created_at: :DESC) }, dependent: :destroy
  # has_many :likes, dependent: :destroy
  # has_many :users, through: :likes

  before_save :titleize_title

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  def titleize_title
    self.title = title.titleize
  end

end
