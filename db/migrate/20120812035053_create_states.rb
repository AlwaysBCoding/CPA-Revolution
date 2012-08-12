class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.string :abbr
      t.integer :age_requirement
      t.boolean :citizenship_requirement
      t.boolean :residency_requirement
      t.boolean :ssn_requirement
      t.text :education_requirement
      t.boolean :international_examination_program
      t.text :hours_requirement
      t.text :sitting_requirements
      t.text :experience_requirements
      t.text :ethics_requirements
      t.text :notes

      t.timestamps
    end
  end
end
