class SearchesController < ApplicationController

  def show
  end

  def find
    @start_station_id = params[:search][:start_station_id]
    @end_station_id = params[:search][:end_station_id]
    @search = Search.new(@start_station_id, @end_station_id )
    if @search.valid?
      @results = @search.find
    end
    flash[:error] = @search.errors.full_messages
    render :show
  end

end
