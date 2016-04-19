require 'rails_helper'

RSpec.describe "currencies/exchange.html.erb", :type => :view do
  
  before do
    doc = Currency.new(Date.today.to_s)
    @exchange_rates = doc.get_elements('pozycja')
    assign :exchange_rates, @exchange_rates

    render
  end
  
  it 'renders _exchange_rates partial' do
      expect(view).to render_template(:partial => "_exchange_rates")
  end
  
  it 'displays a link to save exchange rates as PDF' do
    expect(rendered).to have_link("Save as PDF", :href=>"/currencies/exchange.pdf")
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
