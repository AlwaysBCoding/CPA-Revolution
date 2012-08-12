class State < ActiveRecord::Base
  attr_accessible :abbr, :age_requirement, :citizenship_requirement, :education_requirement, :ethics_requirements, :experience_requirements, :hours_requirement, :international_examination_program, :name, :notes, :residency_requirement, :sitting_requirements, :ssn_requirement, :board_name, :address, :telephone_number, :fax_number, :email_address, :website
end
