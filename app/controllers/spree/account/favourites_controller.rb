module Spree
  module Account
    class FavouritesController < Spree::StoreController

      before_filter :check_logged_in_user

      def index
        @user = try_spree_current_user
        if @user
          line_items = Spree::LineItem.includes(:variant, order: [:user]).where(['spree_orders.user_id = ?', @user.id]).all
          ordered_items = line_items.inject({}) do |result, line_item|
            if result[line_item.variant.sku]
              result[line_item.variant.sku][:number_of_orders] = result[line_item.variant.sku][:number_of_orders] + 1
            else
              result[line_item.variant.sku] = {variant: line_item.variant, number_of_orders: 1}
            end
            result
          end

          @favourites = ordered_items.values
          @favourites = @favourites.sort_by{|favourite| favourite[:number_of_orders]}.reverse
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
