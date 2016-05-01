class SessionsController < ApplicationController
  def login
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Welcome back."
      redirect_to user
    else
      flash[:danger] = "Invalid username/password combination"
      redirect_to :background
    end
  end

  def destroy
    log_out
    flash[:success] = "You have successfully logged out."
    redirect_to root_url
  end
end
