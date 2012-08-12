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