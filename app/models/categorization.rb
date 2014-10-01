class Categorization < ActiveRecord::Base
  belongs_to :cat, :category

  validates :cat, uniqueness: {scope: :category}
end
