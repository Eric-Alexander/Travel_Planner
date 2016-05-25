class JoinsController < ApplicationController
  def join
    Join.create(user_id: session[:user_id], trip_id: params[:id])
    redirect_to :back
  end
  def cancel
    joined_trip = Join.find_by(user_id: session[:user_id], trip_id: params[:id])
    joined_trip.destroy
    redirect_to :back
  end
end
