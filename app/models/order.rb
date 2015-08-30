class Order < ActiveRecord::Base
  belongs_to :order_status
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
  has_many :order_items
  has_many :transactions

  after_save :set_order_items_active_false
  after_save :listing_is_sold?

  def order_total
    
  end

  def add_line_items_from_cart(cart)
    cart.order_items.each do |item|
      item.cart_id = nil
      order_items << item
    end
  end

  private

  def set_order_items_active_false
    self.order_items.each do |item|
      item.listing.update(active: false)
    end
  end

  def listing_is_sold?
    self.order_items.each do |item|
      item.listing.update(sold: true)
    end
  end
end
