class ChangeCategoryIdInCategorizations < ActiveRecord::Migration
  def change
    change_column :categorizations, :category_id, :integer, null: false
  end
end
