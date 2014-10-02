class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, null: false
  end
end
