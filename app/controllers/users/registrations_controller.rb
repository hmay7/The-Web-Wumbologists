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

        resource.generate_lat_long!
        resource.save
        yield resource if block_given?
        if resource.persisted?


          custom_table = nil
          if type == "Family"
            custom_table = Family.new
          elsif type == "Supplier"
            custom_table = Supplier.new
          elsif type == "Shelter"
            custom_table = Shelter.new
          end
          custom_table.user_id = resource.id
          custom_table.save!


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

    end
  end

  # GET /resource/edit
  def edit
    @user = current_user
    @shelter = Shelter.find_by_user_id(@user.id)
    @supplier = Supplier.find_by_user_id(@user.id)
    @family = Family.find_by_user_id(@user.id)
    super
  
  end

  # PUT /resource
  def update
    super
    current_user.generate_lat_long!
    current_user.save!

    if user_is_family?
      fam = Family.find_by_user_id(current_user.id)
      use = current_user
      fam.num_pets = params[:num_pets] if params[:num_pets] != nil
      fam.num_family_members = params[:num_family_members] if params[:num_family_members] != nil
      use.contact_first_name = params[:contact_first_name] if params[:contact_first_name] != nil
      use.contact_last_name = params[:contact_last_name] if params[:contact_last_name] != nil
      use.primary_phone = params[:primary_phone] if params[:primary_phone] != nil
      use.secondary_phone = params[:secondary_phone] if params[:secondary_phone] != nil
      use.street_address = params[:street_address] if params[:street_address] != nil
      use.city = params[:city] if params[:city] != nil
      use.county = params[:county] if [:country] != nil
      use.state = params[:state] if [:state] != nil
      use.zip = params[:zip] if [:zip] != nil
      fam.save!

    elsif user_is_shelter?
      shelt = Shelter.find_by_user_id(current_user.id)
      use = current_user
      shelt.name = params[:name] if params[:name] != nil
      shelt.capacity_total = params[:capacity_total] if params[:capacity_total] != nil
      shelt.capacity_available = params[:capacity_available] if params[:capacity_available] != nil
      shelt.pet_friendly = params[:pet_friendly] if params[:pet_friendly] != nil
      use.contact_first_name = params[:contact_first_name] if params[:contact_first_name] != nil
      use.contact_last_name = params[:contact_last_name] if params[:contact_last_name] != nil
      use.primary_phone = params[:primary_phone] if params[:primary_phone] != nil
      use.secondary_phone = params[:secondary_phone] if params[:secondary_phone] != nil
      use.street_address = params[:street_address] if params[:street_address] != nil
      use.city = params[:city] if params[:city] != nil
      use.county = params[:county] if [:country] != nil
      use.state = params[:state] if [:state] != nil
      use.zip = params[:zip] if [:zip] != nil
      shelt.save!

    elsif user_is_supplier?
      supp = Supplier.find_by_user_id(current_user.id)
      use = current_user
      supp.name = params[:name] if params[:name] != nil
      supp.gasoline_gallons = params[:gasoline_gallons] if params[:gasoline_gallons] != nil
      supp.water_gallons = params[:water_gallons] if params[:water_gallons] != nil
      supp.meals_quantity = params[:meals_quantity] if params[:meals_quantity] != nil
      supp.blanket_quantity = params[:blanket_quantity] if params[:blanket_quantity] != nil
      use.contact_first_name = params[:contact_first_name] if params[:contact_first_name] != nil
      use.contact_last_name = params[:contact_last_name] if params[:contact_last_name] != nil
      use.primary_phone = params[:primary_phone] if params[:primary_phone] != nil
      use.secondary_phone = params[:secondary_phone] if params[:secondary_phone] != nil
      use.street_address = params[:street_address] if params[:street_address] != nil
      use.city = params[:city] if params[:city] != nil
      use.county = params[:county] if [:country] != nil
      use.state = params[:state] if [:state] != nil
      use.zip = params[:zip] if [:zip] != nil
      supp.save!

    end
      
  end

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
