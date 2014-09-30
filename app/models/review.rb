class Review < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_review, against: [:review]
  pg_search_scope :search_user, against: [:user]

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

  def self.authorized_find(user, id)
    if user.is_admin?
      find(id)
    else
      where(user: user).find(id)
    end
  end
end
