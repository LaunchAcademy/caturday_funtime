class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, presence: true, default: 'member'
  end
end
