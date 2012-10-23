require 'spec_helper'

describe IdeasController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end
    
  describe "GET new" do
    it "assigns the requested idea as @idea" do
      get :new
      assigns(:idea).should be_an_instance_of Idea
    end
  end

end
