class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end
  def create
    puts "++++++++++++++++++++++++++++++"
    puts current_user
    puts "++++++++++++++++++++++++++++++"
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
  # def join
  #   current_user = params[:user_id]
  #   trip_id = params[:id]
  #   popo = TripUser.new(trip_id: trip_id, user_id: current_user )
  #   puts "++++++++++++++++++++++++++++++"
  #   puts popo.trip_id
  #   puts "__________________________"
  #   puts popo
  #   puts "__________________________"
  #   puts popo.user_id
  #
  #   redirect_to :back
  #
  # end
# <%= button_to "Create", trips_path, id: current_user, class: "btn btn-success" %>


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
