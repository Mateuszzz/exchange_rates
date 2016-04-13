require 'rails_helper'

RSpec.describe "static_pages/home.html.erb", :type => :view do
  
  it "displays a link to current exchange rates" do
    render
    
    expect(rendered).to have_link('Check current exchange rates', href: currencies_exchange_path)
  end
end