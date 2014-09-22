class AddUrlUniquenessToCats < ActiveRecord::Migration
  def change
    add_index :cats, :url, unique: true
  end
end
