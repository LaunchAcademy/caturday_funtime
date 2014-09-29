class AddIndexToVotes < ActiveRecord::Migration
  def change
    add_index :votes, :user_id
    add_index :votes, [:voteable_type, :voteable_id, :user_id], unique: true
  end
end
