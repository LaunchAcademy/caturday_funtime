class Review < ActiveRecord::Base
  belongs_to :cat
  belongs_to :user

  validates :review, :cat, :user, presence: true
end
