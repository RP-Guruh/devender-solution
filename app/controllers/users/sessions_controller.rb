# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  
    def create
      self.resource = User.find_for_database_authentication(email: params[:user][:email])
      
      if resource && resource.valid_password?(params[:user][:password])
        if resource.otp_required_for_login
          # Store user ID in session for the second step
          session[:otp_user_id] = resource.id
          # Important: sign_out to ensure no partial session exists
          sign_out(resource) if user_signed_in?
          
          redirect_to two_factor_authentication_path, notice: "Please enter your 2FA code to complete sign in."
        else
          # Standard login without 2FA
          set_flash_message!(:notice, :signed_in)
          sign_in(resource_name, resource)
          yield resource if block_given?
          respond_with resource, location: after_sign_in_path_for(resource)
        end
      else
        # Authentication failed
        set_flash_message!(:alert, :invalid, scope: "devise.failure", authentication_keys: "Email")
        render :new
      end
    end
  

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
