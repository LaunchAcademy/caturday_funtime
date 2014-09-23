class Review < ActiveRecord::Base
  belongs_to :cat

  validates :review, :cat, presence: true
end
