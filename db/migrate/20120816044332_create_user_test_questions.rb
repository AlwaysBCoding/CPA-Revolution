class CreateUserTestQuestions < ActiveRecord::Migration
  def change
    create_table :user_test_questions do |t|
      t.integer :user_test_id
      t.integer :question_id
      t.integer :answered_id

      t.timestamps
    end
  end
end
