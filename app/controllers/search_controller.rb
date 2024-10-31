class SearchController < ApplicationController
  def index
    @results = []

    if params[:query].present? && params[:type].present?
      @results = case params[:type]
                 when 'task'
                   Task.where('name ILIKE ?', "%#{params[:query]}%")
                 when 'list'
                   List.where('name ILIKE ?', "%#{params[:query]}%")
                 else
                   []
                 end
    end
  end
end