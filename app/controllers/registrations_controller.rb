class RegistrationsController < ApplicationController
    def new
        # instance variable to be visible in the view
        @user = User.new


    end
  def create
    super
    if resource.save
      UserMailer.welcome_email(resource).deliver
    end
  end
end