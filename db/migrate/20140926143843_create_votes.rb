class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :value, null: false
      t.references :voteable, polymorphic: true, null: false
      t.timestamps
    end
  end
end
