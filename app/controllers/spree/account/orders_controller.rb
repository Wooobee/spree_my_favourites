module Spree
  module Account
    class OrdersController < Spree::StoreController

      def index
        if try_spree_current_user
          @user = try_spree_current_user
          @orders = @user.orders.complete
        else
          unauthorized
        end
      end

    end
  end
end
