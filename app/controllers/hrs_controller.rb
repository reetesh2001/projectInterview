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
      redirect_to @hr, notice: 'User was successfully created.'
    else
      render :new, status:422
    end
  end

  def edit
    @hr = Hr.find(params[:id])
  end

  def update
    @hr = Hr.find(params[:id])
    if @hr.update(hr_params)
      redirect_to @hr
    else
      render :edit
    end
  end

  def destroy
    @hr = Hr.find(params[:id])
    @hr.destroy
    redirect_to root_path, status: :see_other
  end

  private
  def hr_params
    params.require(:hr).permit(:name, :email, :status, :password, :password_confirmation, :phone_number)
  end
end
