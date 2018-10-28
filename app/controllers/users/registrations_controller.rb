# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    type = params[:user_type];
    if type != nil
      puts "TYPE = #{type}"
      User.transaction do 
        build_resource(sign_up_params)

        resource.save
        yield resource if block_given?
        if resource.persisted?
          if resource.active_for_authentication?
              set_flash_message! :notice, :signed_up
              sign_up(resource_name, resource)
              respond_with resource, location: after_sign_up_path_for(resource)
          else
            set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
            expire_data_after_sign_in!
            respond_with resource, location: after_inactive_sign_up_path_for(resource)
          end
        else
          clean_up_passwords resource
          set_minimum_password_length
          respond_with resource
        end
      end

      custom_table = nil
      if type == "Family"
        custom_table = Family.new
      elsif type == "Supplier"
        custom_table = Supplier.new
      elsif type == "Shelter"
        custom_table = Shelter.new
      end
      while (current_user == nil)
        sleep(0.3)
      end
      custom_table.user_id = resource.id
      custom_table.save!
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def sign_up_params
    params.require(:user).permit(:email, :password, :encrypted_password, :user_name, :contact_first_name, :contact_last_name, :primary_phone, :secondary_phone, :street_address, :city, :county, :state, :zip, :user_type)
  end

  def update_params
    params.require(:user).permit(:email, :password, :encrypted_password, :user_name, :contact_first_name, :contact_last_name, :primary_phone, :secondary_phone, :street_address, :city, :county, :state, :zip, :user_type)
  end
end
