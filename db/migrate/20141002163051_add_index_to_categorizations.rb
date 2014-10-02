class AddIndexToCategorizations < ActiveRecord::Migration
  def change
    add_index :categorizations, [:category_id, :cat_id], unique: true
  end
end
