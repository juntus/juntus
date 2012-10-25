class UsersController < ApplicationController
  before_filter :authenticate!
  
  def dashboard
    @user = current_user
  end
end
