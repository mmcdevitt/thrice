class OrderItemDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def name
    listing.name
  end

  def to_currency
    number_to_currency listing.selling_price
  end

  def buyer_name
    order.buyer.username
  end

  def shipping_address
    order.shipping_address
  end

  def order_date
    created_at.strftime("%B %-d, %Y")
  end

  def seller_name
    seller.name
  end
end