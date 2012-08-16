class CreateUserTests < ActiveRecord::Migration
  def change
    create_table :user_tests do |t|
      t.integer :user_id
      t.integer :score

      t.timestamps
    end
  end
end
