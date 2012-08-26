class User < ActiveRecord::Base
  attr_accessible :username, :email, :password_digest, :password, :password_confirmation, :far_date, :reg_date, :bec_date, :aud_date, :far_score, :reg_score, :bec_score, :aud_score, :university, :first_name, :last_name
  
  has_many :user_tests
  
  has_secure_password
  
  validates_uniqueness_of :email
  validates_uniqueness_of :username
  validates_presence_of :first_name
  validates_presence_of :last_name

  def score(code)
    case code 
      when "FAR"
        return far_score.to_i
      when "REG"
        return reg_score.to_i
      when "BEC"
        return bec_score.to_i
      when "AUD"
        return aud_score.to_i
    end      
  end
  
  def exam_date(code)
    case code 
      when "FAR"
        return far_date
      when "REG"
        return reg_date
      when "BEC"
        return bec_date
      when "AUD"
        return aud_date
    end      
  end
  
  def sections_passed
    value = 0
    self.far_score.to_i >=75 ? value += 1 : "";    
    self.reg_score.to_i >=75 ? value += 1 : "";    
    self.bec_score.to_i >=75 ? value += 1 : "";    
    self.aud_score.to_i >=75 ? value += 1 : "";    
    
    case value
      when 0
        return "Just starting out"
      when 1
        return "On the board (1 section passed)"
      when 2
        return "Halfway to CPA (2 sections passed)"
      when 3
        return "Almost there! (3 sections passed)"
      when 4
        return "CPA!!!!!"
    end          
  end

end
