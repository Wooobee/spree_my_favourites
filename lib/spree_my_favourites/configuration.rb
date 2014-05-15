module SpreeMyFavourites
  class Configuration < Spree::Preferences::Configuration
    preference :use_quick_add_to_cart_form, :boolean, default: false
  end
end
