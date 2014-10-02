class AddOptionToOptOutOfReviewEmail < ActiveRecord::Migration
  def change
    add_column :users, :review_email, :boolean, default: true
  end
end
