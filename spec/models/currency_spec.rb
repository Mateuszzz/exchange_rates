require 'rails_helper'

RSpec.describe Currency, :type => :model do
  
  describe "Instance methods" do
    
    it "get elements" do
      doc = Currency.new(Date.today.to_s) 
      elements = doc.get_elements('pozycja')
      
      expect(elements.first.css("nazwa_waluty")).not_to be_empty
    end
  end
  
  describe "Validations" do
    
    it "is valid with correct data" do
      doc = Currency.new(Date.today.to_s)
      expect(doc.error?).to be_equal(false)
    end
    
    it "is invalid with too old date" do
      doc = Currency.new("1999-01-01")
      expect(doc.error?).to be_equal(true)
    end
   
    it "is invalid with future date" do
      doc = Currency.new((Date.today+1).to_s)
      expect(doc.error?).to be_equal(true)
    end
    
    it "is invalid with wrong format of date" do
      dates = %w[2014/04/06 08/04/2016 08-04-2016 some_string]
      dates.each do |date|
        doc = Currency.new(date)
        expect(doc.error?).to be_equal(true)
      end
    end
    
  end
end
