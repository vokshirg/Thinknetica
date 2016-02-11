class WagonsController < ApplicationController
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]

  def index
    @wagons = Wagon.all
  end

  def show
  end

  def new
    @wagon = Wagon.new
  end

  def get_class(name)
     Object.const_get(name)
  end

  def create
    @wagon  = get_class(params[:wagon][:type]).new(wagon_params)
    if @wagon.save
      redirect_to wagons_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @wagon.update(wagon_params)
      redirect_to wagons_path
    else
      render :index
    end
  end

  def destroy
    @wagon.destroy
    redirect_to wagons_path
  end

  private

  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    params.require(:wagon).permit(:type, :train_id, :top_places, :bottom_places, :side_top_places, :side_bottom_places, :seat_places)
  end
end
