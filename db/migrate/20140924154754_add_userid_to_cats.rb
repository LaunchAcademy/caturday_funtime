class AddUseridToCats < ActiveRecord::Migration
  def change
    add_column :cats, :user_id, :integer, null: false
  end
end
