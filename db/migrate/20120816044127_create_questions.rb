class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :topic_id
      t.text :question_text
      t.string :difficulty

      t.timestamps
    end
  end
end
