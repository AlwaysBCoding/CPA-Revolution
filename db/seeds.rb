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
# Add questions_per_testlet and time_per_test

s = Section.all
s.each do |section|

  case section.code
    when "FAR"
      s.questions_per_testlet = 30
      s.time_per_test = 14400
      s.save
    when "REG"
      s.questions_per_testlet = 24
      s.time_per_test = 10800
      s.save
    when "BEC"
      s.questions_per_testlet = 24
      s.time_per_test = 10800
      s.save
    when "AUD"
      s.questions_per_testlet = 30
      s.time_per_test = 14400
      s.save
  end

end

# END questions_per_testlet and time_per_test
