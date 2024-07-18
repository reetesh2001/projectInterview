class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
  end
  
  def create
    @hr = Hr.find_by(email: params[:email])
    if @hr&.authenticate(params[:password])
      session[:user_id] = @hr.id
      redirect_to @hr
    else
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
  
end
