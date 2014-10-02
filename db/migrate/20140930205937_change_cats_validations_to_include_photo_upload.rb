class ChangeCatsValidationsToIncludePhotoUpload < ActiveRecord::Migration
  def up
    change_column :cats, :url, :string
  end

  def down
    change_column :cats, :url, :string, null: false
  end
end
