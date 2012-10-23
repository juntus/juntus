# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SessionsController do
  render_views

  describe "GET create" do
    before(:each) do 
      @user = FactoryGirl.create(:user, :provider => 'facebook', :uid => '100003045769261')
      request.env["omniauth.auth"] = {"provider"=>"facebook", "uid"=>"100003045769261", "credentials"=>{"token"=>"AAADvZADZBnlLABAMVZAUX1s7ptC0m9HZCaaIkMw8AMxFBtV3uZCmjflQDKba5PPt3kqZAgVlmZCeA6tXAUaBlLEInggas8lAGIzXzP4azfrsgZDZD"}, "info"=>{"nickname"=>nil, "email"=>"contato@startupdev.com.br", "first_name"=>"Dejurema", "last_name"=>"Jockifort", "name"=>"Dejurema Jockifort", "image"=>"http://graph.facebook.com/100003045769261/picture?type=square", "urls"=>{"Facebook"=>"http://www.facebook.com/profile.php?id=100003045769261", "Website"=>nil}}, "extra"=>{"user_hash"=>{"id"=>"100003045769261", "name"=>"Dejurema Jockifort", "first_name"=>"Dejurema", "last_name"=>"Jockifort", "link"=>"http://www.facebook.com/profile.php?id=100003045769261", "gender"=>"male", "email"=>"contato@startupdev.com.br", "timezone"=>-2, "locale"=>"pt_BR", "updated_time"=>"2011-10-18T15:01:20+0000"}}}
    end
    it "should set user id on session" do
      get :create, :provider => 'facebook'
      session[:user_id].should == @user.id
    end
    it "should set flash message" do
      get :create, :provider => 'facebook'
      flash[:notice].should == "Opa! Você está online!"
    end
    it "should redirect to edit user url" do
      get :create, :provider => 'facebook'
      response.should redirect_to(root_path)
    end
  end
  describe "subject" do
    before(:each) do
      @user = FactoryGirl.create(:user, :provider => 'facebook', :uid => '100003045769261')
      request.env["omniauth.auth"] = {"provider"=>"facebook", "uid"=>"100003045769261", "credentials"=>{"token"=>"AAADvZADZBnlLABAMVZAUX1s7ptC0m9HZCaaIkMw8AMxFBtV3uZCmjflQDKba5PPt3kqZAgVlmZCeA6tXAUaBlLEInggas8lAGIzXzP4azfrsgZDZD"}, "info"=>{"nickname"=>nil, "email"=>"contato@startupdev.com.br", "first_name"=>"Dejurema", "last_name"=>"Jockifort", "name"=>"Dejurema Jockifort", "image"=>"http://graph.facebook.com/100003045769261/picture?type=square", "urls"=>{"Facebook"=>"http://www.facebook.com/profile.php?id=100003045769261", "Website"=>nil}}, "extra"=>{"user_hash"=>{"id"=>"100003045769261", "name"=>"Dejurema Jockifort", "first_name"=>"Dejurema", "last_name"=>"Jockifort", "link"=>"http://www.facebook.com/profile.php?id=100003045769261", "gender"=>"male", "email"=>"contato@startupdev.com.br", "timezone"=>-2, "locale"=>"pt_BR", "updated_time"=>"2011-10-18T15:01:20+0000"}}}
    end    
    it "should redirect to edit user url" do
       get :create, :provider => 'facebook'
       response.should redirect_to(root_path)      
    end  
  end
  describe "GET failure" do 
    it "should render template" do
      get :failure
      response.should redirect_to(root_url)
    end
    it "should set flash message" do
      get :failure
      flash[:alert].should == 'Não foi possível autenticar, tente novamente.'
    end
  end
  describe "GET destroy" do
    it "should nuliffy user_id on sessions" do
      session[:user_id] = "1"
      get :destroy
      session[:user_id].should be_nil
    end
    it "should set flash message" do
      get :destroy
      flash[:notice].should == "Hum... Volte em breve!"
    end
    it "should redirect to root url" do
      get :destroy
      response.should redirect_to(root_url)
    end
  end
end
