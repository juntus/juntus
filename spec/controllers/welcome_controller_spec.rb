require 'spec_helper'

describe WelcomeController do
  render_views

  describe "GET 'index'" do
    let!(:idea) { FactoryGirl.create(:idea) }
    
    it "returns http success" do
      get 'index'
      response.should be_success
    end
    
    it "should set @ideas" do
      get 'index'
      assigns(:ideas).should == [idea]
    end
  end
end