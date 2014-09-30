class Cat < ActiveRecord::Base
  has_many :reviews, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :votes, as: :voteable

  belongs_to :user

  validates :name, :user, presence: true
  validates :url, presence: true, uniqueness: true
  validates :description, length: { maximum: 255 }

  def vote_score
    return votes.sum(:value)
  end

  def self.authorized_find(user, id)
    if user.is_admin?
      find(id)
    else
      where(user: user).find(id)
    end
  end
end
