class AddIndexToCatUrl < ActiveRecord::Migration
  def change
    add_index :cats, :url
  end
end
