class AddCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :tag
      t.timestamps
    end
  end
end
