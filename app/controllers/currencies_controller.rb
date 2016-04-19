class CurrenciesController < ApplicationController
  before_action :set_up_exchange_rates, :only => [:exchange, :converter]
  
  def exchange
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ExchangeRatesPdf.new(@exchange_rates, Date.today)
        send_data pdf.render, filename: "exchange_rates_#{Date.today}.pdf", type: "application/pdf"
      end
    end
  end
  
  def archival_exchange
    if params[:search].present?
      
      @date = params[:search] 
      @doc = Currency.new(@date.clone)
      
      if @doc.error?
        flash[:danger] = "There is some technical problem. Please try again later."
        redirect_to currencies_archival_exchange_path
    
      else
        @exchange_rates = @doc.get_elements('pozycja')
      end
   
    end
    
    respond_to do |format|
      format.html
      format.pdf do
        
        if params[:search].present?   
          pdf = ExchangeRatesPdf.new(@exchange_rates, @date)
          send_data pdf.render, filename: "exchange_rates_#{@date}.pdf", type: "application/pdf"
          
        else
          redirect_to currencies_archival_exchange_path
        end
      end
    end
  end
  
  def converter
  end
  
  private
  
    def set_up_exchange_rates
      @doc = Currency.new(Date.today.to_s)
    
      if @doc.error?
          flash[:danger] = "There is some technical problem. Please try again later."
          redirect_to root_path
    
      else
        @exchange_rates = @doc.get_elements('pozycja')
      end
    end
end
