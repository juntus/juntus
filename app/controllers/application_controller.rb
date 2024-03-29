# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :user_signed_in?
  before_filter :save_return_path
  
  private
  def save_return_path
    session[:return_path] = request.path
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    !current_user.nil?
  end
  
  def authenticate!
    user_signed_in? || redirect_to((request.env["HTTP_REFERER"].blank?) ? root_path : :back, :alert => "Você precisa estar logado...")
  end
end
