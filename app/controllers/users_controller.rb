class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :favorite]
  before_action :correct_user, only: [:show, :edit, :update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "編集完了"
    else
      render :edit
    end
  end

  def confirm
    @user = User.new(user_params)
    render :new if @user.invalid?
  end


  def favorite
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :icon)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    set_user
    redirect_to user_path(current_user) unless current_user?(@user)
  end
end
