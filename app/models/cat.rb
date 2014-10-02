class Cat < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_name, against: [:name]
  pg_search_scope :search_description, against: [:description]
  pg_search_scope :search_user, against: [:user]

  has_many :reviews, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :votes, as: :voteable
  has_many :categorizations
  has_many :categories, through: :categorizations

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

  def tag_string
    self.categories.pluck(:tag).join(" ")
  end

  def tag_string=(value)
    clear_existing

    if !value.empty?
      tags = value.split(' ')
      tags.each do |tag|
        category = Category.find_or_create_by(tag: tag)
        Categorization.create!(cat_id: self.id, category_id: category.id)
      end
    end
  end

  def clear_existing
    former_tags = Categorization.where(cat_id: self.id)

    if former_tags
      former_tags.each do |tag|
        tag.destroy
      end
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
