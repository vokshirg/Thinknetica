class RoutesController < ApplicationController
  before_action :set_route, except: [:index, :new, :create, :route_params]

  def index
    @routes = Route.all
  end

  def show
  end

  def new
    @route = Route.new
  end

  def create
    @route  = Route.new(route_params)
    if @route.save
      redirect_to @route
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @route.update(route_params)
      redirect_to @route
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to routes_path
  end

  # def add_railway_station
  #   @route.railway_stations << RailwayStation.find(params[:railway_station_id])
  #   redirect_to edit_route_path
  # end

  # def delete_railway_station
  #   @route.railway_stations.delete(params[:railway_station_id])
  #   redirect_to edit_route_path
  # end

  def change_sort_number

    st =  RailwayStation.find(params[:st_id])
    rsr = st.railway_stations_routes.where(route: @route).first
    rsr.sort_number = params[:sort_number]
    rsr.save
    redirect_to @route
  end


  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name, :st_id, railway_station_ids: [])
  end
end
