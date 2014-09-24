class AddIndexToUserReviews < ActiveRecord::Migration
  def change
    add_index :reviews, :user_id
  end
end
