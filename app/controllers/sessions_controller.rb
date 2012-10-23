# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
  skip_before_filter :save_return_path
  
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_or_create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to redirect_path, notice: "Opa! Você está online!"
  end

  def failure
    redirect_to root_url, :alert => 'Não foi possível autenticar, tente novamente.'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Hum... Volte em breve!"
  end
  
  private
  def redirect_path
    session[:return_path] || root_path
  end  
end