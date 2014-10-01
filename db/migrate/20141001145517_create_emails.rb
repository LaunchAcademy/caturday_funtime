class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :new_review

      t.timestamps
    end
  end
end
