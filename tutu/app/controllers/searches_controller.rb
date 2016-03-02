class SearchesController < ApplicationController

  def show
  end

  def find
    unless params[:start_station].blank? && params[:end_station].blank?
      @start_station = RailwayStation.find(params[:start_station])
      @end_station = RailwayStation.find(params[:end_station])

      if @start_station == @end_station
        flash.now[:error] = 'Станции не могут быть равны'
        render :show
      else
        trains_start_st = Train.joins(route: :railway_stations).where("railway_station_id = ?" , @start_station)
        trains_end_st =   Train.joins(route: :railway_stations).where("railway_station_id = ? ", @end_station)

        @results = trains_start_st & trains_end_st

        render :show, start_station: params[:start_station], end_station: params[:end_station]
      end
    else

      flash.now[:error] = 'Укажите начальную и конечную станцию'
      render :show
    end


  end

end
