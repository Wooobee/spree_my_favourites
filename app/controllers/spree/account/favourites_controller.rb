module Spree
  module Account
    class FavouritesController < Spree::StoreController

      before_filter :check_logged_in_user

      def index
        @user = try_spree_current_user
        if @user
          @favourites = Spree::Variant.favourites_by_user(@user).page(params[:page] ||= 1).per(15)
        else
          unauthorized
        end
      end

      private

      def check_logged_in_user
        redirect_to spree_login_path unless try_spree_current_user
      end

    end
  end
end
