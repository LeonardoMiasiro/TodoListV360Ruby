class ListsController < ApplicationController
  before_action :set_list, only: [:edit, :update, :destroy]

  def index
    @lists = List.order(:position)
  end

  def create
    @list = List.create(name: params[:list][:name], position: params[:list][:position])
    if @list.valid?
      redirect_to lists_path
    end
  end

  def edit
    @list = List.find(params[:id])
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

  def set_list
    @list = List.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to lists_path, alert: 'Lista não encontrada.'
  end

  def list_params
    params.require(:list).permit(:name, :position)
  end
end