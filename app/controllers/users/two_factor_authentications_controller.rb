# app/controllers/users/two_factor_authentications_controller.rb
class Users::TwoFactorAuthenticationsController < ApplicationController
  before_action :require_pending_two_factor

  def show
    
  end

  def create
    user = User.find(session[:otp_user_id])
    
    if user.validate_and_consume_otp!(params[:otp_attempt])
      session.delete(:otp_user_id)
      sign_in(user)
      redirect_to admin_dashboard_path, notice: 'Login successful. Welcome back!'
    else
      flash.now[:alert] = 'Invalid OTP code. Please try again.'
      render :show
    end
  end

  private

  def require_pending_two_factor
    unless session[:otp_user_id]
      redirect_to new_user_session_path
    end
  end
end