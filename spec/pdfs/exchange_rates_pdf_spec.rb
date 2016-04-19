require "spec_helper"

doc = Currency.new(Date.today.to_s)
exchange_rates = doc.get_elements('pozycja')
Exchange_Rates_Pdf = ExchangeRatesPdf.new(exchange_rates, Date.today)

RSpec.describe Exchange_Rates_Pdf do
  
  describe "Content" do
    
    before do
      @pdf = PDF::Inspector::Text.analyze(Exchange_Rates_Pdf.render)
    end
    
    it "contains a date of exchange rates" do    
      expect(@pdf.strings.to_s).to include("Exchange rates of #{Date.today}")
    end
    
    it "contains a currency name" do
      expect(@pdf.strings.to_s).to include("#{exchange_rates.first.css('nazwa_waluty').text}")
    end
    
    it "contains a conversion rate" do
      expect(@pdf.strings.to_s).to include("#{exchange_rates.first.css('przelicznik').text}")
    end
  
    it "contains a currency code" do
      expect(@pdf.strings.to_s).to include("#{exchange_rates.first.css('kod_waluty').text}")
    end
  
    it "contains a average exchange rate" do
      expect(@pdf.strings.to_s).to include("#{exchange_rates.first.css('average exchange rate').text}")
    end
  end  
end