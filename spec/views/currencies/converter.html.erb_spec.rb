require 'rails_helper'

RSpec.describe "currencies/converter.html.erb", :type => :view do
    
  before do
    doc = Currency.new(Date.today.to_s)
    @exchange_rates = doc.get_elements('pozycja')
    assign :exchange_rates, @exchange_rates

    render
  end  
    
  it 'displays a form to convert currencies' do
    expect(rendered).to have_tag('.convert-form') do
      with_tag "input", :with => { :name => "amount", :type => 'text', :maxlength => 10 }
      with_tag "select", :with => { :name => "current_currency" }
      with_tag "select", :with => { :name => "target_currency" }
      with_tag "button", "Calculate"
    end
  end
end
