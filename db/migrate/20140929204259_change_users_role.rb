class ChangeUsersRole < ActiveRecord::Migration
  def up
    change_column :users, :role, :string, null: false, default: 'member'
  end

  def down
    change_column :users, :role, :string, presence: true, default: 'member'
  end
end
