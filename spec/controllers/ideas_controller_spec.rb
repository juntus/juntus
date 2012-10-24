# -*- encoding : utf-8 -*-
require 'spec_helper'

describe IdeasController do

  def valid_attributes
    {title: "Londrina", description: "Lorem Ipsum é simplesmente uma simulação", short_description: "Lorem Ipsum é simplesmente uma simulação"}
  end

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
  
  describe "POST create" do
    it "creates a new Idea" do
      expect {
        post :create, idea: valid_attributes
      }.to change(Idea, :count).by(1)
    end

    it "assigns a created idea" do
      post :create, idea: valid_attributes
      assigns(:idea).should be_a(Idea)
      assigns(:idea).should be_persisted
    end

    it "redirects to the index" do
      post :create, idea: valid_attributes
      response.should redirect_to(welcome_index_path)
    end
  end    

  describe "GET show" do
    let!(:idea) { FactoryGirl.create(:idea) }
    
    it "assigns the requested city as @city" do
      get :show, :id => idea.id
      assigns(:idea).should eq(idea)
    end
  end

end
