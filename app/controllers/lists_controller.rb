class ListsController < ApplicationController

  def index
    @lists = List.includes(:tasks).all
  end

  def create
    @list = List.create(name: params[:list][:name])
    if @list.valid?
      redirect_to lists_path
    end
  end

  def update
    if @list.update(list_params)
      redirect_to lists_path
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      redirect_to lists_path
    end
  end

  def list_params
    params.require(:list).permit(:name, :position)
  end
end