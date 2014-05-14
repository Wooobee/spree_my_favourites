module Spree
  module Account
    class FavouritesController < Spree::StoreController

      before_filter :check_logged_in_user

      def index
        @user = try_spree_current_user
        if @user
          @line_items_by_variant = Spree::Variant.includes(line_items: [:order])
            .where(['spree_orders.email = ?', @user.email])
            .where(['spree_orders.completed_at IS NOT NULL'])
            .references(:orders).group('spree_variants.id')
            .order('COUNT(spree_line_items.id) DESC').page(params[:page] || 1).per(15)

          @favourites = []
          @line_items_by_variant.count('spree_line_items.id').each do |variant_id, number_of_orders| 
            @favourites << {variant: Spree::Variant.find(variant_id), number_of_orders: number_of_orders}
          end
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
