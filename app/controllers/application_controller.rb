class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  def save_return_path
    session[:return_path] = request.path
  end
end
