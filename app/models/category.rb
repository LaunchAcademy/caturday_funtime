class Category < ActiveRecord::Base
  has_many :categorizations, dependent: :destroy
  has_many :cats, through: :categorizations

  validates :tag, uniqueness: true

  def self.authorized_find(user, id)
    if user.admin?
      find(id)
    end
  end
end
