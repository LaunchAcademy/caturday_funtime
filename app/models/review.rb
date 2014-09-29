class Review < ActiveRecord::Base
  has_many :votes, as: :voteable
  belongs_to :cat
  belongs_to :user

  validates :review, :cat, :user, presence: true

  def vote_score
    return votes.sum(:value)
  end

  def editable_by?(user)
    self.user == user || user.is_admin?
  end
end
