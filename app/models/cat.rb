class Cat < ActiveRecord::Base
  has_many :reviews

  validates :name, presence: true
  validates :url, presence: true, uniqueness: true
end
