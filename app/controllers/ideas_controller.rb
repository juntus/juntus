# -*- encoding : utf-8 -*-
class IdeasController < ApplicationController
  def new
    @idea = Idea.new
  end
  
  def create
    @idea = Idea.new(params[:idea])

    if @idea.save
      redirect_to @idea, notice: 'Idea criada com Sucesso.'
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
