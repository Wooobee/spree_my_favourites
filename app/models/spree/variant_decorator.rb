Spree::Variant.class_eval do

  def self.favourites_by_user(user)
    Spree::Variant.joins(line_items: [order: [:user]])
    .where(['spree_users.id = ?', user.id])
    .where(['spree_orders.completed_at IS NOT NULL'])
    .references(:orders)
    .group('spree_variants.id')
    .order('COUNT(spree_line_items.id) DESC')
    .select('spree_variants.*')
  end

end
