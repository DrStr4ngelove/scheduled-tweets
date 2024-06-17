class PasswordsController < ApplicationController
    # require user to be logged in before accessing the edit and update actions
    before_action :require_user_logged_in! # From app/controllers/application_controller.rb

    def edit
        
    end

    def update
        # if the password is correct
        if Current.user.update(password_params)
            redirect_to root_path, notice: "Password updated successfully!"
        else 
            # otherwise, render the edit page again
            render :edit
        end

    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end