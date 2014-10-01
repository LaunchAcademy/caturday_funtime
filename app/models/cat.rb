class Cat < ActiveRecord::Base
  has_many :reviews, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :votes, as: :voteable

  belongs_to :user

  validates :name, :user, presence: true, length: { maximum: 55 }
  validates :description, length: { maximum: 255 }
  validates :url, uniqueness: true, if: 'url.present?'

  validate :url_or_upload
  mount_uploader :cat_photo, CatPhotoUploader

  def vote_score
    return votes.sum(:value)
  end

  def self.authorized_find(user, id)
    if user.is_admin?
      find(id)
    else
      where(user: user).find(id)
    end
  end

  def url_or_upload
    if url.blank? && cat_photo.blank?
      errors[:base] << "Please enter either a url or upload a file."
    end

    if url.present? && cat_photo.present?
      errors[:base] << "too many cats"
    end
  end
end
