class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
        session[:user_id] = user.id
        # log_in user
        # redirect_to user
        redirect_to root_path, notice: "Logged in successfully"
    else
        flash.now[:alert] = "Invalid email or password"
        render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # log_out
    # redirect_to root_url
    if session[:user_id]
        # session.delete(:user_id)
        session[:user_id] = nil
        # flash[:notice] = "Logged out successfully"
        redirect_to root_path, notice: "Logged out successfully"
    end
  end
end