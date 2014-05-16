module Spree
  module Account
    class OrdersController < Spree::StoreController

      before_filter :check_logged_in_user

      def index
        @user = try_spree_current_user
        @orders = @user.orders.complete.order('completed_at desc')
      end

      def accurate_title
        Spree.t(:my_account)
      end

      private

      def check_logged_in_user
        unless try_spree_current_user
          session[:spree_user_return_to] = account_orders_url 
          redirect_to spree_login_path 
        end
      end

    end
  end
end
