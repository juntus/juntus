# encoding: utf-8
require 'spec_helper'

describe RegistrationsController do
  let(:user) {FactoryGirl.create(:user)}
  let(:idea) {FactoryGirl.create(:idea)}
  
  describe "POST 'register'" do
    context :authenticated do
      before do
        session[:user_id] = user.id
      end
      
      it "returns http success" do
        post 'register', :idea_id => idea.to_param
        response.should redirect_to(idea_path(idea))
      end
      
      it "should create an idea registration" do
        expect {
          post 'register', :idea_id => idea.to_param
        }.to change(idea.registrations, :count)
      end
      
      context "already registered" do
        let!(:registrations) { FactoryGirl.create(:registration, :user => user, :idea => idea)}
        
        it "should not duplicate a registration" do
          expect {
            post 'register', :idea_id => idea.to_param
          }.to_not change(idea.registrations, :count)
        end
      end
    end
    
    context :unauthenticated do
      it "should redirect to idea page" do
        post 'register', :idea_id => idea.to_param
        response.should redirect_to(idea_path(idea))
      end
      
      it "should render an alert message" do
        post 'register', :idea_id => idea.to_param
        flash[:alert].should == "Você precisa estar logado!!"
      end
    end
  end

end
