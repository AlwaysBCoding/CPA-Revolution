namespace :updates do
  desc "Updates the FAR Topics table"
  task :topics_table => :environment do 
    f = File.readlines("#{Rails.root}/doc/FAR_Schema.txt")
    
    array = []
    f.each do |topic|
      array << topic.split(",")
    end
    
    array.each do |topic|
      t = Topic.new
      t.section_id = Section.find_by_code("FAR").id
      t.code = topic[0].to_s
      t.name = topic[1].chomp.to_s
      t.save
    end
  end
end