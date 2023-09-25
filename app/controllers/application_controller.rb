class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:icon, :last_name, :first_name, 
      :nick_name, :phone_number, :prefecture, :municipality, :street_address,
      :movable_range, :sex, :occupation, :postal_code, :self_introduction
      ])
      
    devise_parameter_sanitizer.permit(:account_update, keys: [:icon, :last_name, :first_name, 
      :nick_name, :phone_number, :prefecture, :municipality, :street_address,
      :movable_range, :sex, :occupation, :postal_code, :self_introduction
      ])
  end
end
