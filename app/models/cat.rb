class Cat < ActiveRecord::Base
  has_many :reviews, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :votes, as: :voteable

  belongs_to :user


  validates :name, :user, presence: true
  validates :url, presence: true, uniqueness: true
end
