namespace :updates do  
    desc "Updates the State Accountancy Boards Contact Information from the AICPA Website"
    task :state_boards => :environment do
    
    require 'nokogiri'
    require 'open-uri'

    f = File.open("#{Rails.root}/doc/state_boards.txt", 'w')

    url = "http://www.nasba.org/stateboards/"

    doc = Nokogiri::HTML(open(url))

     doc.css(".mainpost").each do |row|
       if row.at_css('h2')
  
       board_name = row.at_css('h2').text()
   
       addr_array = []
   
       if row.at_css('p').text().scan(/.*\d{5}$/m)
         addr_array << row.at_css('p').text().scan(/.*\d{5}/m)
       elsif row.at_css('p').text().scan(/.*\d{5}-\d{4}$/m)   
         addr_array << row.at_css('p').text().scan(/.*\d{5}-\d{4}$/m)
       end
   
       address = addr_array[0][0]
   
       telephone_array = row.at_css('p').text().scan(/\d{3}-\d{3}-\d{4}/)
       phone_number = telephone_array.first
       fax_number = telephone_array.last
   
       email_string = row.at_css('p').text().scan(/Email:.*/)
       email = email_string[0].gsub!(/Email: /, "")
   
       website = ""
      
       # The Addresses need to be cleaned up a little bit.
       # Need to figure out how to read the websites as well
       f.write "#{board_name}; #{address}; #{phone_number}; #{fax_number}; #{email}; #{website}\n"
      end
     end
    f.close
  end
end