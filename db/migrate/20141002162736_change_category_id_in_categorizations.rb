class ChangeCategoryIdInCategorizations < ActiveRecord::Migration
  def up
    change_column :categorizations, :category_id, :integer, null: false
  end

  def down
    change_column :categorizations, :category_id, :integer
  end
end
