class ChangeBooleansToStringsInStates < ActiveRecord::Migration
  def up
    
    change_column :states, :citizenship_requirement, :string
    change_column :states, :residency_requirement, :string
    change_column :states, :ssn_requirement, :string
    change_column :states, :international_examination_program, :string
    
  end

  def down
  end
end
