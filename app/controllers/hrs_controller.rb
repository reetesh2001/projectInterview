class HrsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def show
    @hr = Hr.find_by(id: params[:id])
  end

  def new
    @hr = Hr.new
  end

  def create
    @hr = Hr.new(hr_params)
    if @hr.save
      session[:user_id]=@hr.id
      redirect_to @hr
    else
      render :new
    end
  end

  private
  def hr_params
    params.require(:hr).permit(:name, :email, :status, :password, :password_confirmation, :phone_number)
  end
end
