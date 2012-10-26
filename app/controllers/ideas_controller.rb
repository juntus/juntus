# -*- encoding : utf-8 -*-
class IdeasController < ApplicationController
  before_filter :authenticate!, :except => [:index, :show]
  
  def edit
    @idea = current_user.ideas.find(params[:id])
  rescue
    redirect_to root_path, :alert => "Você não tem permissão!"
  end
  
  def update
    @idea = current_user.ideas.find(params[:id])
    if @idea.update_attributes(params[:idea])
      redirect_to root_path, :notice => "Atualizado com sucesso!"
    else
      render "edit"
    end
  rescue
    redirect_to root_path, :alert => "Você não tem permissão!"
  end

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