class Admin::BaseController < ApplicationController
  before_action :authenticate_passanger!
  before_action :check_admin

  layout "admin"

  protected

  def check_admin
    redirect_to root_path, alert: "У вас нет прав на просмотр данной страницы" unless current_passanger.admin?
  end

end
