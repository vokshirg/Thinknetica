class TicketsController < ApplicationController
  before_action :authenticate_passanger!
  before_action :set_ticket, only: [:show, :destroy]

  # GET /tickets
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # POST /tickets
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.passanger = current_passanger

    if @ticket.save
      redirect_to @ticket, notice: 'Билет был успешно создан.'
    else
      render :new
    end
  end


  # DELETE /tickets/1
  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: 'Билет был успешно удален.'
  end

  private
    # Use callbacks to share common setup or consticketts between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:passanger_id, :seat, :train_id, :end_station_id, :start_station_id, :passanger_info)
    end
end
