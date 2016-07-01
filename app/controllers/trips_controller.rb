class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end
  def create
      @trip = current_user.trips.create(trip_params)
      join = Join.create(user_id: session[:user_id], trip: @trip)
    if @trip.save
      flash[:success]="Your trip has been added!"
      redirect_to user_path(current_user)
    else
      # flash[:errors] = @trip.errors.full_messages
      # puts "wakka wakka"
      # puts @trip.errors.full_messages

      render :new
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @joins = Join.where(trip_id: @trip.id)

  end
  private
  def trip_params
    user_id = current_user
    params.require(:trip).permit(:destination, :description, :start_date, :end_date, :user_id)
  end
end
