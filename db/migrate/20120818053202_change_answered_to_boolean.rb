class ChangeAnsweredToBoolean < ActiveRecord::Migration
  def up
    change_column :user_test_questions, :answered, :boolean
    rename_column :user_test_questions, :answered, :answered_correct
  end

  def down
  end
end
