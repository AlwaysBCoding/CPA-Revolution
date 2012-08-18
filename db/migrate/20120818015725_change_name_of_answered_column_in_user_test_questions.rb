class ChangeNameOfAnsweredColumnInUserTestQuestions < ActiveRecord::Migration
  def up
    rename_column :user_test_questions, :answered_id, :answered
  end

  def down
  end
end
