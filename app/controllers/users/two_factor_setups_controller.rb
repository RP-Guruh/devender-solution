class Users::TwoFactorSetupsController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user.otp_required_for_login
      # Already active
    else
      # Generate new secret if not present
      if current_user.otp_secret.blank?
        current_user.otp_secret = User.generate_otp_secret
        current_user.save!
      end
    end
  end

  def create
    if current_user.validate_and_consume_otp!(params[:otp_attempt])
      current_user.update!(otp_required_for_login: true)
      redirect_to admin_dashboard_path, notice: 'Two-Factor Authentication has been enabled.'
    else
      flash[:alert] = 'Invalid OTP code. Please try again.'
      redirect_to two_factor_setup_path
    end
  end

  def destroy
    if current_user.validate_and_consume_otp!(params[:otp_attempt])
      current_user.update!(
        otp_required_for_login: false,
        otp_secret: nil
      )
      redirect_to admin_dashboard_path, notice: 'Two-Factor Authentication has been disabled.'
    else
      flash[:alert] = 'Invalid OTP code. Security settings could not be updated.'
      redirect_to two_factor_setup_path
    end
  end
end