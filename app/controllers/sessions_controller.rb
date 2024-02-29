class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      log_in user  # Custom method to log in the user, see below
      redirect_to main_new_path, notice: "Logged in successfully!"
    else
      flash[:notice] = "Invalid email/password combination"
      #render :new
    end
  end

  def destroy
    log_out if logged_in?  # Custom method to log out the user, see below
    redirect_to root_path, notice: "Logged out successfully!"
  end
end