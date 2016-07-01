class JoinsController < ApplicationController
  def join
    @join = Trip.find(params[:join])
    joins = current_user.joins.create(trip_id: @join.id, user_id: current_user.id)
    if joins.save
      flash[:success] = "You have joined the trip!"
    redirect_to :back

  else
    flash[:error] = "You have not joined the trip!"
    redirect_to :back
  end

  end
  def cancel
    joined_trip = Join.find_by(user_id: session[:user_id], trip_id: params[:id])
    joined_trip.destroy
    flash[:success] = "You have been removed from the trip!"
    redirect_to :back
  end
end
