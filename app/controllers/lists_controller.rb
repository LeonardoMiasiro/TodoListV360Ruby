class ListsController < ApplicationController
  def index
    @lists = List.includes(:tasks).all
  end

  def create
    @list = List.create(name: params[:list][:name], position: params[:list][:position])
    if @list.valid?
      redirect_to lists_path
    end
  end

  def update
    @list = List.find(params[:id])
    if @list.update(params.permit(:name, :position))
      redirect_to lists_path
      end
  end


  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      redirect_to lists_path
    end
  end
end