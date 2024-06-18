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

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")

    rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to sign_in_path, alert: "Your token has expired. Please try again."
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(user_params)
      redirect_to sign_in_path, notice: "Your password was reset successfully. Please sign in."
    else
      render :edit
    end

    rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to sign_in_path, alert: "Your token has expired. Please try again."
  end
end
