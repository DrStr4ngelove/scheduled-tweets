class SessionsController < ApplicationController
#   def new
#   end

#   def create
#     user = User.find_by(email: params[:session][:email].downcase)
#     if user && user.authenticate(params[:session][:password])
#       log_in user
#       redirect_to user
#     else
#       flash.now[:danger] = 'Invalid email/password combination'
#       render 'new'
#     end
#   end

  def destroy
    # log_out
    # redirect_to root_url
    if session[:user_id]
    #   session.delete(:user_id)
        session[:user_id] = nil
        # flash[:notice] = "Logged out successfully"
        redirect_to root_path, notice: "Logged out successfully"
    end
  end
end