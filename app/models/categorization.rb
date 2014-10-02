class Categorization < ActiveRecord::Base
  belongs_to :cat
  belongs_to :category

  validates :cat, presence: true, uniqueness: { scope: :category }
  validates :category, presence: true
end
