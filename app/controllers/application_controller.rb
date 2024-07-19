class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private
  def authenticate_user!
    redirect_to login_path, alert: "You must be logged in to access this page." unless current_user
  end
  
  def current_user
      @current_user ||= Hr.find_by(id: session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
