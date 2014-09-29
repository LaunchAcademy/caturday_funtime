class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates :user, presence: true
  validates :voteable_id, uniqueness: { scope: [:user_id, :voteable_type] }
  validates :voteable, presence: true
  validates :value, inclusion: { in: [1, -1] }
  validates :voteable_type, inclusion: { in: %w(Cat Review) }
end
