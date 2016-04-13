require 'rails_helper'

RSpec.describe "currencies/archival_exchange.html.erb", :type => :view do
  
  describe 'for no selected date' do
    
    it 'displays a form to find a archival exchange rates' do
      render
      
      expect(rendered).to have_tag('form', :with => { :action => '/currencies/archival_exchange', :method => 'get' }) do
        with_tag "input", :with => { :name => "search", :type => 'text' }
        with_tag "input", :with => { :value => "Find", :type => 'submit' }
      end
    end
  end
  
  describe 'for selected date' do
    
    before do
      doc = Currency.new(Date.today.to_s)
      @date = Date.today.to_s
      @exchange_rates = doc.get_elements('pozycja')
      assign :exchange_rates, @exchange_rates
      assign :date, @date

      render
    end
  
    it 'displays a selected date' do
      expect(rendered).to have_content("Exchange rates of #{@date}")
    end
  
    it 'displays a currency name' do
      expect(rendered).to have_content("#{@exchange_rates.first.css('nazwa_waluty').text}")
    end
  
    it 'displays a conversion rate' do
      expect(rendered).to have_content("#{@exchange_rates.first.css('przelicznik').text}")
    end
  
    it 'displays a currency code' do
      expect(rendered).to have_content("#{@exchange_rates.first.css('kod_waluty').text}")
    end
  
    it 'displays a average exchange rate' do
      expect(rendered).to have_content("#{@exchange_rates.first.css('kurs_sredni').text}")
    end
  end  
end
