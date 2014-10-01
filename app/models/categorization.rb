class Categorization < ActiveRecord::Base
  belongs_to :cat
  belongs_to :category

  validates :cat, uniqueness: {scope: :category}
end
