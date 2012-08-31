# Add Accountancy Board Information to the Database
f = File.readlines("#{Rails.root}/doc/state_boards.txt")

s_array = State.all
f.each_with_index do |state_str, i|

  state = state_str.split(";")
  if s_array[i]
  
  s = s_array[i]
  s.board_name = state[0].strip
  s.address = state[1].strip
  s.telephone_number = state[2].strip
  s.fax_number = state[3].strip
  s.email_address = state[4].strip
  s.save
  puts "Updating State #{s.name}"
  end

end
# End Add Accountancy Board Information to the Database
# ~ ~ ~ ~ ~
# Create the Four Sections
  Section.create(:code => "FAR",
                  :name => "Financial Accounting and Reporting",
                  :questions_per_testlet => 30,
                  :time_per_test = 14400)
  
  Section.create(:code => "REG",
              :name => "Regulation",
              :questions_per_testlet => 24,
              :time_per_test = 10800)
                              
  Section.create(:code => "BEC",
                      :name => "Business Environment and Concepts",
                      :questions_per_testlet => 24,
                      :time_per_test = 10800)
                                                  
  Section.create(:code => "AUD",
        :name => "Auditing and Attestation",
        :questions_per_testlet => 30,
        :time_per_test = 14400)                

# END Sections Create
