class Cat < ActiveRecord::Base
  has_many :reviews, -> { order(created_at: :desc) }, dependent: :destroy

  validates :name, presence: true
  validates :url, presence: true, uniqueness: true
end
