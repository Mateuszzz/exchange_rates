require 'rails_helper'

RSpec.describe CurrenciesController, :type => :controller do

  describe "GET #exchange" do
    before do
      get :exchange
    end
    
    it "returns http success" do
      expect(response).to be_success
    end
    
    it "renders the home template" do
      expect(response).to render_template("exchange")
    end
  end
  
  describe "GET #archival_exchange" do
    
    context "when search parameter is empty" do    
      before do
        get :archival_exchange
      end
    
      it "returns http success" do
        expect(response).to be_success
      end
    
      it "renders the home template" do
        expect(response).to render_template("archival_exchange")
      end
    end
    
    context "when search parameter is not empty" do    
      before do
        get :archival_exchange, search: "2016-04-08"
      end
    
      it "returns http success" do
        expect(response).to be_success
      end
    
      it "renders the home template" do
        expect(response).to render_template("archival_exchange")
      end
    end
  end
  
  describe "GET #converter" do
    before do
      get :converter
    end
    
    it "returns http success" do
      expect(response).to be_success
    end
    
    it "renders the home template" do
      expect(response).to render_template("converter")
    end
  end
end
