class Cat < ActiveRecord::Base
  has_many :reviews, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :votes, as: :voteable

  belongs_to :user


  validates :name, :user, presence: true
  validate :url_or_upload

  validates :url, uniqueness: true, if: 'url.present?'

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
    if [self.url, self.cat_photo].reject(&:blank?).size == 0
      errors[:base] << ("Please enter either a url or upload a file.")
    end
  end
end
