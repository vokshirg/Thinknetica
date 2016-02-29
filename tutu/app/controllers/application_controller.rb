class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  def after_sign_in_path_for(current_passanger)
    if current_passanger.admin?
      admin_path
    else
      search_path
    end
  end
end
