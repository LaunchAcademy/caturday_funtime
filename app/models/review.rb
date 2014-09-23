class Review < ActiveRecord::Base
  belongs_to :cat

  validates :review, presence: true
end
