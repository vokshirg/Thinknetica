class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :change_route_params]

  # GET /railway_stations
  def index
    @railway_stations = RailwayStation.all
  end

  # GET /railway_stations/1
  def show
  end

  # GET /railway_stations/new
  def new
    @railway_station = RailwayStation.new
  end

  # GET /railway_stations/1/edit
  def edit
  end

  # POST /railway_stations
  def create
    @railway_station = RailwayStation.new(railway_station_params)
    if @railway_station.save
      redirect_to [:admin, @railway_station], notice: 'Станция была успешно создана.'
    else
      render :new
    end
  end

  # PATCH/PUT /railway_stations/1
  def update
    if @railway_station.update(railway_station_params)
      redirect_to [:admin, @railway_station], notice: 'Станция была успешно обновлена.'
    else
      render :edit
    end
  end

  # DELETE /railway_stations/1
  def destroy
    @railway_station.destroy
    redirect_to admin_railway_stations_path, notice: 'Станция была успешно удалена.'
  end

  def change_route_params
    @route =  Route.find(params[:route_id])
    # leave_time = DateTime.civil(*params[:leave_time].sort.map(&:last).map(&:to_i))
    # arrive_time = DateTime.civil(*params[:arrive_time].sort.map(&:last).map(&:to_i))
    @railway_station.change_route_params(@route, params[:sort_number], params[:arrive_time], params[:leave_time])
    redirect_to [:admin, @route]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def railway_station_params
      params.require(:railway_station).permit(:title, :route_id, :sort_number, :arrive_time, :leave_time)
    end
end
