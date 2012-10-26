# -*- encoding : utf-8 -*-
class IdeasController < ApplicationController
  before_filter :authenticate!, :only => [:new, :create]
  
  def new
    @idea = Idea.new
  end
  
  def create
    @idea = current_user.ideas.new(params[:idea])

    if @idea.save
      redirect_to @idea, notice: 'Ideia criada com sucesso.'
    else
      render 'new'
    end  
  end
  
  def show
    @idea = Idea.find(params[:id])
  end
  
  def index
    @ideas = Idea.all
  end
end