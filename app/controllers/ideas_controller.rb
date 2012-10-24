# -*- encoding : utf-8 -*-
class IdeasController < ApplicationController
  def new
    @idea = Idea.new
  end
  
  def create
    @idea = Idea.new(params[:idea])

    if @idea.save
      redirect_to welcome_index_path, notice: 'Idea criada com Sucesso.'
    end
  end
  
  def show
    @idea = Idea.find(params[:id])
  end  
end
