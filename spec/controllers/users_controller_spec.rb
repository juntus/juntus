require 'spec_helper'

describe UsersController do
  render_views
  describe "GET 'dashboard'" do
    context "user authenticated" do
      before { 
        login!
        get 'dashboard'
      }
      it { response.should be_success }
      it { assigns(:user).should be_instance_of User }
    end

    context "without user" do
      before { get :dashboard }
      it { should redirect_to root_path }
    end
  end
end