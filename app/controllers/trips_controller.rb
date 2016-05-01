class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end
  def create
      @trip = Trip.create(trip_params)
    if @trip.save
      flash[:success]="Your trip has been added!"
      redirect_to user_path(current_user)
    else
      flash[:danger]
      redirect_to :back
    end
  end



  def show
  end
  private
  def trip_params
    user_id = current_user
    params.require(:trip).permit(:destination, :description, :start_date, :end_date, user_id: user_id)
  end
end
