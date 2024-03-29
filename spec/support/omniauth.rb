# -*- encoding : utf-8 -*-
module OmniauthLoginTestHelper
  def current_user
    @current_user ||= FactoryGirl.create(:user)
  end

  def login!
    session[:user_id] = current_user.id
  end
end

RSpec.configure do |config|
  config.include OmniauthLoginTestHelper, :type => :controller
  config.include OmniauthLoginTestHelper, :type => :helper
end