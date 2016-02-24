class SearchesController < ApplicationController

  def show
  end

  def find
    @start_station = RailwayStation.find(params[:start_station])
    @end_station = RailwayStation.find(params[:end_station])
    trains_start_st = Train.joins(route: :railway_stations).where("railway_station_id = ?" , @start_station)
    trains_end_st =   Train.joins(route: :railway_stations).where("railway_station_id = ? ", @end_station)

    @results = trains_start_st & trains_end_st

    render :show, start_station: params[:start_station], end_station: params[:end_station]
  end

  def fill_ticket
    render :fill_ticket
  end

  private


    # Never trust parameters from the scary internet, only allow the white list through.
    # def search_params
    #   params.require(:ticket).permit(:number, :time, :seat, :end_station_id, :start_station_id, :passanger_id, :train_id)
    # end


end
