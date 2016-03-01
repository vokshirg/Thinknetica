class Admin::PassangersController < Admin::BaseController
  before_action :set_passanger, only: [:show, :edit, :update, :destroy]

  # GET /passangers
  def index
    @passangers = Passanger.all
  end

  # GET /passangers/1
  def show
  end

  # GET /passangers/new
  def new
    @passanger = Passanger.new
  end

  # GET /passangers/1/edit
  def edit
  end

  # POST /passangers
  def create
    @passanger = Passanger.new(passanger_params)

    if @passanger.save
      # redirect_to @passanger, notice: 'Пассажир был успешно создан.'
    else
      render :new
    end
  end

  # PATCH/PUT /passangers/1
  def update
    if @passanger.update(passanger_params)
      redirect_to [:admin, @passanger], notice: 'Пассажир был успешно изменен.'
    else
      render :edit
    end
  end

  # DELETE /passangers/1
  def destroy
    @passanger.destroy
    redirect_to admin_passangers_url, notice: 'Пассажир был успешно удален.'
  end

  private
    # Use callbacks to share common setup or conspassangerts between actions.
    def set_passanger
      @passanger = Passanger.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def passanger_params
      params.require(:passanger).permit(:name, :train_id)
    end
end
