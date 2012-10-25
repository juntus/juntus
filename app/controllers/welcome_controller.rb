class WelcomeController < ApplicationController
  def index
    @ideas = Idea.all
  end
  
  def quem_somos
    
  end
end
