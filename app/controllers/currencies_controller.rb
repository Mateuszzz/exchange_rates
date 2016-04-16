class CurrenciesController < ApplicationController
  before_action :set_up_exchange_rates, :only => [:exchange, :converter]
  
  def exchange
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
