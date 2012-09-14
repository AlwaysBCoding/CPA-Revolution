class InfoController < ApplicationController
  
  def index
  end
  
  def exam_information
  end
  
  def sandbox
    render 'sandbox/index.html.erb'
  end
  
  def contact
  end
  
  def stock
    render 'sandbox/stock.html.erb'
  end
  
  def stock_issue
    case params["issueStockType"]
      when "commonStock"
        @stockType = "Common Stock"
      when "preferredStockNoInformation"
        @stockType = "Preferred Stock"  
    end
    
    if params[:date]
    @issueDateMonth = Date::MONTHNAMES[params["date"]["issueDateMonth"].to_i]
    @issueDateDay = params["date"]["issueDateDay"].to_i
    @issueDateYear = params["date"]["issueDateYear"]
    @dateString = "on #{@issueDateMonth} #{@issueDateDay}, #{@issueDateYear}"
    else
    @issueDateMonth, @issueDateDay, @issueDateYear, @dateString = nil, nil, nil, nil
    end
    
    @numberOfShares = params["issueNumberOfShares"].gsub(/[^\d]/, "").to_i
    @parValue = params["issueParValue"].gsub(/[^\d]/, "").to_i
    @marketPrice = params["issueMarketPrice"].gsub(/[^\d]/, "").to_i
    if params["issueIssueCosts"]
    @issueCosts = params["issueIssueCosts"].gsub(/[^\d]/, "").to_i
    else
    @issueCosts = 0
    end 
    @sharesOutstanding = params["issueSharesOutstanding"].gsub(/[^\d]/, "").to_i + @numberOfShares
    
    @cash = @numberOfShares * @marketPrice - @issueCosts
    @stockCredit = @numberOfShares * @parValue unless @parValue == 0
    
    if @marketPrice > @parValue
    @APIC = @numberOfShares * (@marketPrice - @parValue) unless @parValue == 0
    elsif @parValue > @marketPrice
    @discount = @numberOfShares * (@parValue - @marketPrice)
    end
    
    if @parValue == 0
    @stockCredit = @numberOfShares * @marketPrice
    end
    
    
    render 'sandbox/stock/issue.js.erb'
  end
  
  def bonds
    render 'sandbox/bonds.html.erb'
  end
  
end