class User < ActiveRecord::Base
  has_many :cats, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :votes, dependent: :destroy

  def admin?
    self != nil && role == 'admin'
  end

  def editable_by?(user)
    self == user || user.admin?
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :name, presence: true, uniqueness: true, length: {maximum: 16}

  mount_uploader :profile_photo, ProfilePhotoUploader

end
