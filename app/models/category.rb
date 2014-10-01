class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :cats, through: :categorizations

  validates :tag, uniqueness: true
end
