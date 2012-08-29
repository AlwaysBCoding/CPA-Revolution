class InfoController < ApplicationController
  
  def index
  end
  
  def exam_information
  end
  
  def videos
  end
  
  def sandbox
    question = "The following information pertains to a sale and leaseback of equipment by Mega Co. on December 31, Year 1:\n\ntable(table table-bordered).\n|Sales Price|$400,000|\n|Carrying amount|$300,000|\n|Monthly lease payments|$3,250|\n|Present value of lease payments|$36,900|\n\nThe estimated remaining life of the asset is 25 years and the lease term is 1 year. Mega uses IFRS. The sales price is equal to the fair value of the leaseback asset. What amount of deferred gain on the sale should Mega report at December 31, Year 1?"
    
    puts question
    
    @text = RedCloth.new(question).to_html.html_safe
    # puts @text
  end
  
  def contact
  end
  
  def stock
    render 'sandbox/stock.html.erb'
  end
  
  def bonds
    render 'sandbox/bonds.html.erb'
  end
  
end