# encoding: utf-8
class RegistrationsController < ApplicationController
  before_filter :require_authentication!
  
  def register
    idea.registrations.find_or_create_by_user_id(current_user.id)
    
    redirect_to idea
  end
  
  private 
    def require_authentication!
      return redirect_to idea, :alert => "Você precisa estar logado!!" unless current_user
    end
    
    def idea
      @idea ||= Idea.find(params[:idea_id])
    end
end
