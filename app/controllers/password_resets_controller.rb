class PasswordResetsController < ApplicationController
  def new
    # action code
  end

  def create
    if @user.present?
        # send email to user with password reset link
        PasswordMailer.with(user: @user).reset.deliver_later # deliver_now will slow down the rails server
    end
    redirect_to root_path, notice: "If an account with that email exists, we will send you a password reset link."
  end
end
