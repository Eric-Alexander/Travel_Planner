class UsersController < ApplicationController
  def new
      @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @other_trips = Trip.all.where.not(user_id: @user)
    @my_trips = Join.where(user: current_user).joins(:trip)
  end

  def create
      @user = User.create(user_params)
      if @user.save
        log_in @user

          flash[:success] = "Welcome to the club."
          redirect_to @user
      else
          render :new
      end
  end

  def destroy
    log_out
    flash[:success] = "You have successfully logged out."
    redirect_to root_url
  end

  private
  def user_params
      params.require(:user).permit(:name, :username, :password, :password_confirmation)
  end
end
