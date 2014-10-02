class RemoveUrlIndexFromCats < ActiveRecord::Migration
  def up
    remove_index :cats, :url
  end

  def down
    add_index :cats, :url, unique: true
  end
end
