class ChangeCatIdInCategorizations < ActiveRecord::Migration
  def up
    change_column :categorizations, :cat_id, :integer, null: false
  end

  def down
    change_column :categorizations, :cat_id, :integer
  end
end
