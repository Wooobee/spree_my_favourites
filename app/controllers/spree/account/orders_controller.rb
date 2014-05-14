module Spree
  module Account
    class OrdersController < Spree::StoreController

      def index
        if try_spree_current_user
          @user = try_spree_current_user
          @orders = @user.orders.complete.order('completed_at desc')
        else
          unauthorized
        end
      end

      def accurate_title
        Spree.t(:my_account)
      end

    end
  end
end
