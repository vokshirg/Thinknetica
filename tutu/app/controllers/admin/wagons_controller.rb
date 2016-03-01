class Admin::WagonsController < Admin::BaseController
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create, :index]

  def index
    @wagons = Wagon.all
  end

  def show
  end

  def new
    @wagon = Wagon.new
  end

  def create
    # cl = get_class(params[:wagon][:type])
    @wagon  = @train.wagons.new(wagon_params)

    if @wagon.save
      redirect_to admin_train_wagons_path(@train)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @wagon.update(wagon_params)
      redirect_to admin_train_wagons_path(@wagon.train)
    else
      render :edit
    end
  end

  def destroy
    @wagon.destroy
    redirect_to admin_train_wagons_path(@wagon.train)
  end

  private

  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def wagon_params
    params.require(:wagon).permit(:type, :train_id, :top_places, :bottom_places, :side_top_places, :side_bottom_places, :seat_places)
  end

  def get_class(name)
     Object.const_get(name)
  end

end
