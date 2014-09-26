class Review < ActiveRecord::Base
  has_many :votes, as: :voteable
  belongs_to :cat
  belongs_to :user

  validates :review, :cat, :user, presence: true
end
