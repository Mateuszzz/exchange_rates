require 'rails_helper'

RSpec.describe CurrenciesController, :type => :controller do

  context 'PDF' do
    
    describe "GET #exchange" do
       it "returns http success" do
        get :exchange, format: :pdf
        
        expect(response).to be_success
      end
    end
    
    describe "GET #archival_exchange" do
      
      context "when search parameter is not empty" do
        it "returns http success" do
         get :archival_exchange, format: :pdf, search: "2016-04-08"
        
         expect(response).to be_success
        end
      end
      
      context "when search parameter is empty" do
        it "redirect to archival exchange" do
         get :archival_exchange, format: :pdf
        
         expect(response).to redirect_to(currencies_archival_exchange_path)
        end
      end
    end
  end  
  
  context 'HTML' do
    
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
end
