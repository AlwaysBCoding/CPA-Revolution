namespace :updates do
  desc "Enters the unformatted AICPA released questions data into the database as dummy data"
  task :dummy_qdata => :environment do 
    f = File.open("#{Rails.root}/doc/mcq.txt", 'r')    
    f = f.readlines(";")
    
    q_array = []
    f.each do |question|
    q_array << question.split(/',|,\s'|';/)
    end
    
    q_array.delete_at(161)
    q_array.delete_at(161)
    9.times do
      q_array.delete_at(217)
    end
    q_array.delete_at(119)
        
    q_array.each_with_index do |question, index|
      q = Question.new
      q.topic_id = rand(32)
      q.question_text = question[1].chomp.strip.gsub(/"|'/, "").to_s
      q.source = question[7].chomp.strip.gsub(/"|'/, "").to_s
      q.save
      
      a = Answer.new
      a.question_id = q.id
      a.answer_text = question[2].chomp.strip.gsub(/"|'/, "").to_s
      question[6] == 1 ? a.correct = true : a.correct = false
      a.save
      
      a = Answer.new
      a.question_id = q.id
      a.answer_text = question[3].chomp.strip.gsub(/"|'/, "").to_s
      question[6] == 2 ? a.correct = true : a.correct = false
      a.save
      
      a = Answer.new
      a.question_id = q.id
      a.answer_text = question[4].chomp.strip.gsub(/"|'/, "").to_s
      question[6] == 3 ? a.correct = true : a.correct = false
      a.save
      
      a = Answer.new
      a.question_id = q.id
      a.answer_text = question[5].chomp.strip.gsub(/"|'/, "").to_s
      question[6] == 4 ? a.correct = true : a.correct = false
      a.save
      
      puts "Saved Question #{index+1}"
    end
  
  end
end