class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @hr = Hr.new
  end
  
  def create
    @hr = Hr.find_by(email: params[:email])
    if @hr != nil && @hr&.authenticate(params[:password])
      session[:user_id] = @hr.id
      redirect_to @hr, notice: 'User was successfully login.'
    else
      flash[:alert] = 'User was not successfully login'
      redirect_to login_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'User was successfully logout.'
  end
end
