class Cat < ActiveRecord::Base

  validates :name, presence: true
  validates :url, presence: true, uniqueness: true
end
