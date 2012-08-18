class ChangeAnsweredToBoolean < ActiveRecord::Migration
  def up
    delete_column :user_test_questions, :answered
    add_column :user_test_questions, :answered_correct, :boolean
  end

  def down
  end
end
