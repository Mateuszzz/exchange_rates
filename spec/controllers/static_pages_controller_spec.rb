require 'rails_helper'

RSpec.describe StaticPagesController, :type => :controller do

  describe "GET #home" do
    before do
      get :home
    end
    
    it "returns http success" do
      expect(response).to be_success
    end
    
    it "renders the home template" do
      expect(response).to render_template("home")
    end
  end
end
