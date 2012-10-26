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
    context "with valid params" do
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
        response.should redirect_to(idea_path(assigns(:idea)))
      end      
    end
    context "with invalid params" do
      def do_action(param)
        post(:create, idea: param)
      end
      
      before do
        do_action({title: "", description: "", short_description: "Lorem Ipsum é simplesmente uma simulação"})
      end

      it { should render_template(:new) }
      it { should respond_with(:success) }
    end      
  end    

  describe "GET show" do
    let!(:idea) { FactoryGirl.create(:idea) }
    
    it "assigns the requested city as @city" do
      get :show, :id => idea.id
      assigns(:idea).should eq(idea)
    end
  end
  
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
