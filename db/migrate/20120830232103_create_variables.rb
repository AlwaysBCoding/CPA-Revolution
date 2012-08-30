class CreateVariables < ActiveRecord::Migration
  def change
    create_table :variables do |t|
      t.integer :question_id
      t.string :format
      t.integer :minimun
      t.integer :maximum
      t.integer :multiple
      t.string :description

      t.timestamps
    end
  end
end
