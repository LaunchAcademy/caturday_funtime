class AddPhotoUploadToCats < ActiveRecord::Migration
  def change
    add_column :cats, :cat_photo, :string
  end
end
