class AddIndexToCategories < ActiveRecord::Migration
  def change
    add_index :categories, :tag
  end
end
