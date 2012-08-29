class InfoController < ApplicationController
  
  def index
  end
  
  def exam_information
  end
  
  def videos
  end
  
  def sandbox
    render 'sandbox/index.html.erb'
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