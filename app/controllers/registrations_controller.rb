class RegistrationsController < ApplicationController

  def new
      # instance variable to be visible in the view
      @user = User.new
  end

  def create
    # from create form submit
    # params => {"authenticity_token"=>"[FILTERED]", "user"=>{"email"=>"[FILTERED]", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Sign Up"}
    # params[:user] => {"password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Sign Up"}

    # create a new user with the params from the form submit (user_params)
    @user = User.new(user_params)
    if @user.save
      # redirect to home page
      redirect_to root_path, notice: "Successfully signed up!"
    else
      puts "Error saving user"
      # render the sign up form again
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
