# -*- encoding : utf-8 -*-
require 'spec_helper'

describe IdeasController do

  def valid_attributes
    {title: "Londrina", description: "Lorem Ipsum é simplesmente uma simulação", short_description: "Lorem Ipsum é simplesmente uma simulação"}
  end

  describe "POST 'update'" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:idea) { FactoryGirl.create(:idea, :user_id => user.id) }
    context "with authenticated user" do
      before do 
        login!
      end
      context "with valid params" do
        context "when user owns the idea" do
          before do
            session[:user_id] = user.id
            put 'update', :id => idea.to_param, :idea => { :title => "Curitiba" }
          end

          it { assigns(:idea).should == idea }
          it { redirect_to(root_path) }
          it { flash[:notice].should == "Atualizado com sucesso!" }
          it { idea.reload.title.should == "Curitiba" }
        end
        context "when user isnt the idea's owner" do
          it "should raise error" do
            expect{ 
              put 'update', :id => idea.to_param 
            }.to raise_error(ActiveRecord::RecordNotFound)
          end
        end
      end
      context "with invalid params" do
        before do
          session[:user_id] = user.id
          put 'update', :id => idea.to_param, :idea => { :title => "" }
        end
        context "when user owns the idea" do
          it { assigns(:idea).should == idea }
          it { render_template 'edit' }
        end
      end
    end
    
    context "without authenticated user" do
      it "should redirect to home" do
        put 'update', :id => idea.to_param, :idea => { :title => "Curitiba" }
        response.should redirect_to(root_path)
      end
    end
  end
  
  describe "GET 'edit" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:idea) { FactoryGirl.create(:idea, :user_id => user.id) }
    context "with authenticated user" do
      before do
        login!
      end
      context "when user owns the idea" do
        before do
          session[:user_id] = user.id
          get 'edit', :id => idea.to_param
        end
      
        it { response.should be_success }
        it { assigns(:idea).should be_instance_of Idea }
        it { render_template 'edit' }
      end
      context "when user isnt the idea's owner" do
        it "should raise error" do
          expect{ 
            get 'edit', :id => idea.to_param
          }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
    
    context "without authenticated user" do
      it "should redirect to home" do
        get 'edit', :id => idea.to_param
        response.should redirect_to(root_path)
      end
    end
  end

  describe "GET 'new'" do
    context "with authenticated user" do
      before do
        login!
        get 'new'
      end

      it { response.should be_success }
      it { assigns(:idea).should be_instance_of Idea }
      it { render_template 'new' }
    end
    
    context "without authenticated user" do
      it "should redirect to home" do
        get 'new'
        response.should redirect_to(root_path)
      end
    end
  end

  describe "POST create" do
    context "with authenticated user" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        login!
        session[:user_id] = user.id
      end
      
      context "with valid params" do
        before { post :create, idea: valid_attributes }
        
        it { assigns(:idea).should be_a(Idea) }
        it { assigns(:idea).should be_persisted }
        it { response.should redirect_to(idea_path(assigns(:idea))) }
        it { user.reload.ideas.count.should == 1 }
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
    
    context "without authenticated user" do
      it "should redirect to home" do
        post :create
        response.should redirect_to(root_path)
      end
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
