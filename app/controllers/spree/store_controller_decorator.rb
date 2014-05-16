Spree::StoreController.class_eval do

  before_filter :clear_stored_location_for_sign_in

  def clear_stored_location_for_sign_in
    session[:return_to] = nil
  end

end
