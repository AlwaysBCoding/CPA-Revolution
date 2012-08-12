namespace :table_updates do
  task :update_requirements_table => :environment do
    desc "Update the State Requirements Table (State)"
    
    require 'nokogiri'
    require 'open-uri'

    f = File.readlines("#{Rails.root}/doc/state_list.txt")
    f.each do |f|
      array = f.split(',')
  
      array.each do |abbr|
        
            s = State.new
            s.abbr = abbr
            s.name = array[1].chomp
        
            url = "https://www.thiswaytocpa.com/exam-licensure/state-requirements/#{abbr}/"
            doc = Nokogiri::HTML(open(url))
              doc.css('#exam_licensure tr').each_with_index do |tr, i|
                case i 
                  when 0  
                    s.age_requirement = tr.at_css('td').text.strip.chomp
                  when 1
                    s.citizenship_requirement = tr.at_css('td').text.strip.chomp
                  when 2
                    s.residency_requirement = tr.at_css('td').text.strip.chomp
                  when 3
                    s.ssn_requirement = tr.at_css('td').text.strip.chomp
                  when 4
                    s.education_requirement = tr.at_css('td').text.strip.chomp      
                  when 5
                    s.international_examination_program = tr.at_css('td').text.strip.chomp
                  when 6
                    s.hours_requirement = tr.at_css('td').text.strip.chomp
                  when 7
                    s.sitting_requirements = tr.at_css('td').text.strip.chomp
                  when 8
                    s.experience_requirements = tr.at_css('td').text.strip.chomp
                  when 9
                    s.ethics_requirements = tr.at_css('td').text.strip.chomp       
                end
              end
           s.save
           puts "State Saved #{array[1].chomp}"   
           break     
      end
    
    end
    
  end  
end