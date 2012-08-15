class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :subclass_id
      t.integer :number
      t.text :question_text
      t.integer :difficulty

      t.timestamps
    end
  end
end
